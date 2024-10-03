
const express = require('express');
const mongoose = require('mongoose');
const cloudinary = require('cloudinary').v2;

const M_Product = require('../model/M_Product');
const ObjectId = mongoose.Types.ObjectId;
const productController = module.exports = {

    getDetailProduct: async (req, res) => {
        try {
            const id = req.params.id;
            const data = await M_Product.find({ _id: new mongoose.Types.ObjectId(id) }
            )
                .select(['_id', 'title', 'description', 'imgProduct', 'discountPercentage', 'priceOriginal', 'priceDiscounted'])
                .exec(); ``

            res.send({
                message: 'Success',
                code: 200,
                data: data[0]
            })
        } catch (error) {
            res.status(404).json({
                message: 'Error',
                code: 404
            })
        }
    },

    getProductData: async (req, res) => {
        try {
            const getList = await M_Product.find({}, {
                title: 1,
                description: 1,
                imgProduct: 1,
                discountPercentage: 1,
                priceOriginal: 1,
                priceDiscounted: 1,
                date_created: 1,
            }).sort({date_created: -1});
            const countProductInDB = getList.length;
            res.status(200).json({
                // countUser: countProductInDB,
                listProduct: getList
            })
        } catch (error) {
            res.send({
                message: "Error - you not admin"
            })
        }
    },
    createProduct: async (req, res) => {
        const dataImage = req.file;
        try {
  
            const { title, description, discountPercentage, priceOriginal, priceDiscounted } = req.body;

            if (!dataImage) {
                return res.status(400).json({
                    code: 400,
                    message: "Error - No image uploaded"
                });
            }
            const objectData = {
                title,
                description,
                imgProduct: dataImage.path,
                discountPercentage,
                priceOriginal,
                priceDiscounted
            };


            const data = await M_Product.create(objectData);

            res.status(200).json({
                code: 200,
                message: "Successfully Create Product Data",
                data
            });
        } catch (error) {
            if (dataImage) {
                cloudinary.uploader.destroy(dataImage.filename)
            }
            res.status(400).json({
                code: 400,
                message: "Error - Unauthorized",
                error: error.message || error
            });
        }
    },

    deleteAllProduct: async (req, res) => {
        try {
            const deleteAll = await M_Product.deleteMany({});
            res.status(200).json({
                message: 'Successfully Delete All Product',
                code: 200,
                data: deleteAll
            })
        } catch (error) {
            res.status(403).json({
                message: 'Error delete all product - you are not ADMIN',
                code: 403
            })
        }
    },

    //DELETE Product BY ID
    deleteProduct: async (req, res) => {

        try {
            const id = req.params.id;

            //check type id 
            if (ObjectId.isValid(id) == false) {
                res.status(403).json({
                    message: 'Success',
                    code: 403,
                    error: 'Data does not exist'
                })
                return
            }

            //check id in MongoDB
            const checkIDInMongo = await M_Product.find({ _id: new mongoose.Types.ObjectId(id) }).exec();
            if (checkIDInMongo === null) {
                res.status(403).json({
                    message: 'Success',
                    code: 403,
                    error: 'Data does not exist'
                })
                return
            }

            const deleteUserByID = await M_Product.findByIdAndDelete({ _id: new mongoose.Types.ObjectId(id) }).exec();
            res.status(200).json({
                message: 'Success',
                code: 200,
                data: {
                    result: 'Delete User Successfully',
                    field: deleteUserByID
                }
            })

        } catch (error) {
            res.status(500).json({
                code: 500,
                message: 'Error',
                error: error
            })
        }
    },

    // Update Product
    updateProduct: async (req, res) => {
        try {

            const {
                title,
                description,
                imgProduct,
                discountPercentage,
                priceOriginal,
                priceDiscounted } = req.body;

            const id = req.params.id;

            //check type id 
            if (ObjectId.isValid(id) == false) {
                res.status(403).json({
                    message: 'Success',
                    code: 403,
                    error: 'Data does not exist'
                })
                return
            }

            //check id in MongoDB
            const checkIDInMongo = await M_Product.find({ _id: new mongoose.Types.ObjectId(id) }).exec();
            if (checkIDInMongo === null) {
                res.status(403).json({
                    message: 'Success',
                    code: 403,
                    error: 'Data does not exist'
                })
                return
            }


            const objectDataUpdate = {};

            objectDataUpdate.title = title;
            objectDataUpdate.description = description;
            objectDataUpdate.imgProduct = imgProduct;
            objectDataUpdate.discountPercentage = discountPercentage;
            objectDataUpdate.priceOriginal = priceOriginal;
            objectDataUpdate.priceDiscounted = priceDiscounted;



            const updateUser = await M_Product.findByIdAndUpdate(id, objectDataUpdate, { new: true })
            res.status(200).json({
                code: 200,
                message: "Product Update Successfully",
                data: updateUser,

            })


        } catch (error) {
            res.status(500).json({
                message: 'Error updating user',
                error: error.message
            });
        }
    },



}