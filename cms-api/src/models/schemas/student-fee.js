const sequelize = require("../../db");
const Sequelize = require("sequelize");
const organisations = require("./organisations");

const studentFee = sequelize.define('StudentFee', 
    { 
        rollNumber: { type: Sequelize.STRING(20), allowNull: false},
        month: { type: Sequelize.STRING(256), allowNull: false},
        amount: { type: Sequelize.DOUBLE, allowNull: true},
        discountAmount: { type: Sequelize.DOUBLE, allowNull: true},
        feeDate: { type: Sequelize.DATE, allowNull: false},
        sessionId: { type: Sequelize.INTEGER, allowNull: false},
        studentId: { type: Sequelize.INTEGER, allowNull: false},
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
module.exports = studentFee;