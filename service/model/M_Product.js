const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const productSchema = new Schema({

    productID: { type: mongoose.Types.ObjectId, default: null },
    title: { type: String, require: true},
    imgProduct: { type: String, default: '' },
    discountPercentage:{type:Number, default:0},
    priceOriginal:{type:Number, default:0},
    description: { type: String, default: '' },
    priceDiscounted:{ type: Number, default: '' },
    date_created: { type: Date, default: Date.now() },
});

const productModel = mongoose.model("product", productSchema);
module.exports = productModel;