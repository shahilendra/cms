
// export all mongo module

module.exports.roles = require('./schemas/roles'); // ok/
module.exports.users = require('./schemas/users'); // ok
module.exports.menus = require('./schemas/menus'); // ok
module.exports.menusPermissions = require('./schemas/menus-permissions'); // ok
module.exports.organisations = require('./schemas/organisations'); // ok 
module.exports.organisationsUsers = require('./schemas/organisations-users'); // ok
module.exports.images = require('./schemas/images'); // ok
module.exports.analytics = require('./schemas/analytics');// ok
module.exports.supportQuery = require('./schemas/support-query'); // ok
module.exports.session = require('./schemas/session'); // ok
module.exports.batch = require('./schemas/batch'); // ok
module.exports.systemSetting = require('./schemas/system-setting'); // ok
module.exports.student = require('./schemas/student'); // ok
module.exports.studentFee = require('./schemas/student-fee'); // ok