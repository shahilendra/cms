const express = require('express');
const router = express.Router();
const models = require("../../models");
const helpers = require("../../shared").helpers;

router.get('/', function(req, res, next) {
    models.systemSetting.findAll({ 
      where: {
        organisationId: req.organisationId
      }
    })
      .then((systemSettings) => {
        if(systemSettings.length>0){
          return Promise.resolve(systemSettings[0]);
        } else {
          return Promise.resolve({});
        }        
      })
      .then(systemSetting =>{
        return helpers.finalResponse(200 , systemSetting, res);
      })
      .catch((error) => {
        return helpers.finalResponse(error.status , error, res);
      });
});

router.get('/:id', function(req, res, next) {
  models.systemSetting.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then((systemSetting) => {
      return helpers.finalResponse(200 , systemSetting, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.post('/', function(req, res, next) {
  let systemSetting = {};
  helpers.updateSystemSetting(systemSetting, req.body, req.userFullName)
    .then(systemSetting => models.systemSetting.create(systemSetting))
    .then((systemSetting) => {
      return helpers.finalResponse(200 , systemSetting, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.put('/:id', function(req, res, next) {
  models.systemSetting.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then(systemSetting => helpers.updateSystemSetting(systemSetting, req.body, req.userFullName))
    .then(systemSetting => models.session.update(systemSetting, { returning: true, where: { id: req.params.id } }))
    .then((systemSetting) => {
      return helpers.finalResponse(200 , systemSetting, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.delete('/:id', function(req, res, next) {
  models.systemSetting.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then(systemSetting => models.systemSetting.destroy({
        where: {
          id: systemSetting.id
        }
      }))
    .then((systemSetting) => {
      return helpers.finalResponse(200 , { message: 'System Setting deleted successfuly!' }, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

module.exports = router;