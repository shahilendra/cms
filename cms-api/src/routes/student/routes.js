const express = require('express');
const router = express.Router();
const models = require("../../models");
const helpers = require("../../shared").helpers;
const sequelize = require("../../db");

router.get('/', function(req, res, next) {
  return sequelize.query(`EXEC GetStudent :orgId, :sessionId`,
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
  models.student.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then((student) => {
      return helpers.finalResponse(200 , student, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.post('/', function(req, res, next) {
  let student = {};
  helpers.updateStudent(student, req.body, req.userFullName, req.systemSetting)
    .then(student => models.student.create(student))
    .then((student) => {
      return helpers.finalResponse(200 , student, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.put('/:id', function(req, res, next) {
  models.student.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then(student => helpers.updateStudent(student, req.body, req.userFullName, req.systemSetting))
    .then(student => models.student.update(student, { returning: true, where: { id: req.params.id } }))
    .then((student) => {
      return helpers.finalResponse(200 , student, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.delete('/:id', function(req, res, next) {
  models.student.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then(student => models.student.destroy({
        where: {
          id: student.id
        }
      }))
    .then((student) => {
      return helpers.finalResponse(200 , { message: 'Student deleted successfuly!' }, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

module.exports = router;