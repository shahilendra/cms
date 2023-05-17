const sequelize = require("../../db");
const Sequelize = require("sequelize");
const organisations = require("./organisations");

const batch = sequelize.define('Batch', 
    { 
        startTime: { type: Sequelize.STRING(10), allowNull: false},
        endTime: { type: Sequelize.STRING(10), allowNull: false},
        name: { type: Sequelize.STRING(256), allowNull: false},
        class: { type: Sequelize.STRING(20), allowNull: true},
        feeAmount: { type: Sequelize.DOUBLE, allowNull: true},
        sessionId: { type: Sequelize.INTEGER, allowNull: false},
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
module.exports = batch;