const { Router } = require('express');
const router = Router();
const sumaController = require('../controller/suma_controller');

router.post('/suma', sumaController.suma);

module.exports = router;