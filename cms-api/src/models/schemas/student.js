const sequelize = require("../../db");
const Sequelize = require("sequelize");
const organisations = require("./organisations");

const student = sequelize.define('Student', 
    { 
        rollNumber: { type: Sequelize.STRING(20), allowNull: false},
        firstName: { type: Sequelize.STRING(256), allowNull: false},
        lastName: { type: Sequelize.STRING(256), allowNull: true},
        middleName: { type: Sequelize.STRING(256), allowNull: true},
        fatherName: { type: Sequelize.STRING(256), allowNull: true},
        motherName: { type: Sequelize.STRING(256), allowNull: true},
        phone: { type: Sequelize.STRING(15), allowNull: true},
        parentPhone: { type: Sequelize.STRING(256), allowNull: true},
        address: { type: Sequelize.STRING(256), allowNull: true},
        city: { type: Sequelize.STRING(256), allowNull: true},
        pinCode: { type: Sequelize.STRING(6), allowNull: true},
        board: { type: Sequelize.STRING(20), allowNull: true},
        joiningDate: { type: Sequelize.DATE, allowNull: false},
        sessionId: { type: Sequelize.INTEGER, allowNull: false},
        batchId: { type: Sequelize.INTEGER, allowNull: false},
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
module.exports = student;