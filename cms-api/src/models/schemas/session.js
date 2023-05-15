const sequelize = require("../../db");
const Sequelize = require("sequelize");
const organisations = require("./organisations");

const session = sequelize.define('Session', 
    { 
        startDate: { type: Sequelize.DATE, allowNull: false},
        endDate: { type: Sequelize.DATE, allowNull: true},
        name: { type: Sequelize.STRING(256), allowNull: false},
        isActive: { type: Sequelize.BOOLEAN, allowNull: false, defaultValue: true },
        createdBy:  { type: Sequelize.STRING(256), allowNull: false},
        updatedBy:  { type: Sequelize.STRING(256), allowNull: true},
        organisationId: {
            type: Sequelize.INTEGER,
            allowNull: false,
            references: {
                model: organisations,
                key: 'id',
            }
        }
    });
module.exports = session;