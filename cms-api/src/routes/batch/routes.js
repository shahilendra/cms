const express = require('express');
const router = express.Router();
const models = require("../../models");
const helpers = require("../../shared").helpers;

router.get('/', function(req, res, next) {
    models.batch.findAll({ 
      where: {
        organisationId: req.organisationId,
        sessionId: req.systemSetting?.sessionId
      }
    })
      .then((batchs) => {
        return helpers.finalResponse(200 , batchs, res);
      })
      .catch((error) => {
        return helpers.finalResponse(error.status , error, res);
      });
});

router.get('/:id', function(req, res, next) {
  models.batch.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then((batch) => {
      return helpers.finalResponse(200 , batch, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.post('/', function(req, res, next) {
  let batch = {};
  helpers.updateBatch(batch, req.body, req.userFullName, req.systemSetting)
    .then(batch => models.batch.create(batch))
    .then((batch) => {
      return helpers.finalResponse(200 , batch, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.put('/:id', function(req, res, next) {
  models.batch.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then(batch => helpers.updateBatch(batch, req.body, req.userFullName, req.systemSetting))
    .then(batch => models.batch.update(batch, { returning: true, where: { id: req.params.id } }))
    .then((batch) => {
      return helpers.finalResponse(200 , batch, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.delete('/:id', function(req, res, next) {
  models.batch.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then(batch => models.batch.destroy({
        where: {
          id: batch.id
        }
      }))
    .then((batch) => {
      return helpers.finalResponse(200 , { message: 'Batch deleted successfuly!' }, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

module.exports = router;