const app = require('express');
const router = app.Router();
const auth = require('./auth/verify-token');

router.use('/v1/auth', require('./auth')); // tested
router.use('/v1/roles', auth, require('./roles')); // tested
router.use('/v1/users', auth, require('./users')); // tested
router.use('/v1/organisations', auth, require('./organisations')); // tested
router.use('/v1/support-query', auth, require('./support-query'));  // tested
router.use('/v1/menus', auth, require('./menus')); // tested
router.use('/v1/menus-permissions', auth, require('./menus-permissions')); // tested
router.use('/v1/organisations-users', auth, require('./organisations-users'));  //tested

router.use('/v1/sessions', auth, require('./session'));  //tested
router.use('/v1/batchs', auth, require('./batch'));  //tested
router.use('/v1/system-settings', auth, require('./system-setting'));  //tested
router.use('/v1/students', auth, require('./student'));  //tested

module.exports = router;