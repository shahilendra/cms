const express = require('express');
const router = express.Router();
const models = require("../../models");
const helpers = require("../../shared").helpers;

router.get('/', function(req, res, next) {
    models.session.findAll({ 
      where: {
        organisationId: req.organisationId
      }
    })
      .then((sessions) => {
        return helpers.finalResponse(200 , sessions, res);
      })
      .catch((error) => {
        return helpers.finalResponse(error.status , error, res);
      });
});

router.get('/:id', function(req, res, next) {
  models.session.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then((session) => {
      return helpers.finalResponse(200 , session, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.post('/', function(req, res, next) {
  let session = {};
  helpers.updateSession(session, req.body, req.userFullName)
    .then(session => models.session.create(session))
    .then((session) => {
      return helpers.finalResponse(200 , session, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.put('/:id', function(req, res, next) {
  models.session.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then(session => helpers.updateSession(session, req.body, req.userFullName))
    .then(session => models.session.update(session, { returning: true, where: { id: req.params.id } }))
    .then((session) => {
      return helpers.finalResponse(200 , session, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

router.delete('/:id', function(req, res, next) {
  models.session.findOne({ 
      where: {
        id: req.params.id
      }
    })
    .then(session => models.session.destroy({
        where: {
          id: session.id
        }
      }))
    .then((session) => {
      return helpers.finalResponse(200 , { message: 'Session deleted successfuly!' }, res);
    })
    .catch((error) => {
      return helpers.finalResponse(error.status , error, res);
    });
});

module.exports = router;