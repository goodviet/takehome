const express = require('express');
const productController = require('../controller/product.controller');
const router = express.Router();
const uploadCloud = require('../config/cloudinary.config')



router.post('/createProduct',uploadCloud.single('image'),  productController.createProduct);
router.delete('/deleteAllProduct', productController.deleteAllProduct);
router.get('/getListData', productController.getProductData);
router.delete('/deleteProduct/:id', productController.deleteProduct);
router.put('/updateProduct/:id', productController.updateProduct);
router.get('/getDetailProduct/:id', productController.getDetailProduct);

module.exports = router;
