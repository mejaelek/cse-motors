// Error Route for intentional 500 error
const express = require("express")
const router = new express.Router()
const errorController = require("../controllers/errorController")
const utilities = require("../utilities/")

// Route to trigger intentional error
router.get("/trigger", utilities.handleErrors(errorController.triggerError));

module.exports = router; 