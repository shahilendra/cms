const express = require('express');
const router = express.Router();
const models = require("../../models");
const helpers = require("../../shared").helpers;
const sequelize = require("../../db");

router.get('/', function(req, res, next) {
  return sequelize.query(`EXEC GetStudentFees :orgId, :sessionId`,
    { replacements: { orgId: req.organisationId, sessionId: req.systemSetting?.sessionId}, type: sequelize.QueryTypes.SELECT }
  )
  .then((students) => {
    return helpers.finalResponse(200 , students, res);
  })
  .catch((error) => {
    return helpers.finalResponse(error.status , error, res);
  });
});

router.get('/:id', function(req, res, next) {
  models.studentFee.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then((studentFee) => {
      return helpers.finalResponse(200 , studentFee, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.post('/', function(req, res, next) {
  let studentFee = {};
  helpers.updateStudentFee(studentFee, req.body, req.userFullName)
    .then(studentFee => models.studentFee.create(studentFee))
    .then((studentFee) => {
      return helpers.finalResponse(200 , studentFee, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.put('/:id', function(req, res, next) {
  models.studentFee.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then(studentFee => helpers.updateStudentFee(studentFee, req.body, req.userFullName))
    .then(studentFee => models.studentFee.update(studentFee, { returning: true, where: { id: req.params.id } }))
    .then((studentFee) => {
      return helpers.finalResponse(200 , studentFee, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.delete('/:id', function(req, res, next) {
  models.studentFee.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then(studentFee => models.studentFee.destroy({
        where: {
          id: studentFee.id
        }
      }))
    .then((studentFee) => {
      return helpers.finalResponse(200 , { message: 'Student Fee deleted successfuly!' }, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.get('/due/fees', function(req, res, next) {
  return sequelize.query(`EXEC GetStudentDueFees :orgId, :sessionId, :date`,
    { replacements: 
      { 
        orgId: req.organisationId,
        sessionId: req.systemSetting?.sessionId,
        date: req.query.date
      }, type: sequelize.QueryTypes.SELECT }
  )
  .then((students) => {
    return helpers.finalResponse(200 , students, res);
  })
  .catch((error) => {
    return helpers.finalResponse(error.status , error, res);
  });
});
router.get('/fee/payments', function(req, res, next) {
  return sequelize.query(`EXEC GetStudentFeeRanges :orgId, :sessionId, :fromDate, :toDate`,
    { replacements: 
      { 
        orgId: req.organisationId,
        sessionId: req.systemSetting?.sessionId,
        fromDate: req.query.fromDate,
        toDate: req.query.toDate
      }, type: sequelize.QueryTypes.SELECT }
  )
  .then((students) => {
    return helpers.finalResponse(200 , students, res);
  })
  .catch((error) => {
    return helpers.finalResponse(error.status , error, res);
  });
});

router.get('/fee/receipt', function(req, res, next) {
  var obj = { 
    orgId: req.organisationId,
    sessionId: req.systemSetting?.sessionId,
    month: req.query.month,
    studentId: req.query.studentId
  };
  if(req.query.feeReceiptId !=='null') {
    obj['feeReceiptId'] = req.query.feeReceiptId;
  } else {
    obj['feeReceiptId'] = null;
  }
  return sequelize.query(`EXEC GetStudentFeeReceipt :orgId, :sessionId, :month, :studentId, :feeReceiptId`,
    { replacements: 
      obj, type: sequelize.QueryTypes.SELECT }
  )
  .then((students) => {
    return helpers.finalResponse(200 , students, res);
  })
  .catch((error) => {
    return helpers.finalResponse(error.status , error, res);
  });
});

router.get('/fee/monthly-dashboard', function(req, res, next) {
  return sequelize.query(`EXEC GetStudentMonthlyFeeDashboard :orgId, :sessionId`,
    { replacements: 
      { 
        orgId: req.organisationId,
        sessionId: req.systemSetting?.sessionId
      }, type: sequelize.QueryTypes.SELECT }
  )
  .then((monthlyFees) => {
    return helpers.finalResponse(200 , monthlyFees, res);
  })
  .catch((error) => {
    return helpers.finalResponse(error.status , error, res);
  });
});
router.get('/fee/daily-dashboard', function(req, res, next) {
  return sequelize.query(`EXEC GetStudentDailyFeeDashboard :orgId, :sessionId`,
    { replacements: 
      { 
        orgId: req.organisationId,
        sessionId: req.systemSetting?.sessionId
      }, type: sequelize.QueryTypes.SELECT }
  )
  .then((dailyFees) => {
    return helpers.finalResponse(200 , dailyFees, res);
  })
  .catch((error) => {
    return helpers.finalResponse(error.status , error, res);
  });
});
module.exports = router;