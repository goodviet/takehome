// const check = (arr) => {
//     const checkUP =  [];
//     const result = [];
  

//   arr.map((item ) => {
//     const lowercase = typeof item === 'string' ? item.toLowerCase() : item;
//     if (!checkUP.includes(lowercase)) {
//       checkUP.push(lowercase);   
//       result.push(item);       
//     }

//   })
  
//     return result;
// }

// console.log(check(['Car', 'Bike', 'car', 'BIKE', 'CAR', 'bike']));

const data = {
  fieldname: 'image',
  originalname: 'v2.png',
  encoding: '7bit',
  mimetype: 'image/png',
  path: 'https://res.cloudinary.com/dbke6n2lz/image/upload/v1727925447/product/fhzjgpyzbkjvxzsn3mbj.png',
  size: 54007,
  filename: 'product/fhzjgpyzbkjvxzsn3mbj'
};
console.log(data['path']);
