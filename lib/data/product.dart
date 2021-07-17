class Product {
  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final int discount;
  final double stock;
  final String unit;
  final String image;

  Product({
    this.id,
    this.name,
    this.category,
    this.description,
    this.price,
    this.discount,
    this.stock,
    this.unit,
    this.image,
  });
}

final List<Product> productBestsellers = [
  Product(
    id: '1',
    name: 'Big Fresh Plum Red Tomato 250 g',
    category: 'Vegetarian',
    description:
        'Plum tomatos are the ultimate paste and canning tomato. They are low in moisture with dense flesh, feew seeds, and rich, sweet flavor.',
    price: 5.92,
    discount: 10,
    stock: 350,
    unit: 'Kg',
    image: 'assets/images/products/product-01.jpg',
  ),
  Product(
    id: '2',
    name: 'Green Fresh String 80 g',
    category: 'Vegetarian',
    description:
        'Green fresh string are the ultimate paste and canning string. They are low in moisture with dense flesh, feew seeds, and rich, sweet flavor.',
    price: 39.99,
    discount: 30,
    stock: 250,
    unit: 'Kg',
    image: 'assets/images/products/product-02.jpg',
  ),
  Product(
    id: '3',
    name: 'Cripps Pink Apple Big 10 g',
    category: 'Fruit',
    description:
        'Crips pink apple are the ultimate paste and canning apple. They are low in moisture with dense flesh, feew seeds, and rich, sweet flavor.',
    price: 10.58,
    discount: 10,
    stock: 150,
    unit: 'Kg',
    image: 'assets/images/products/product-03.jpg',
  ),
  Product(
    id: '4',
    name: 'Fresh Up Big Fizz Orange 10 g',
    category: 'Fruit',
    description:
        'Fresh orange are the ultimate paste and canning orange. They are low in moisture with dense flesh, feew seeds, and rich, sweet flavor.',
    price: 8.72,
    discount: 10,
    stock: 150,
    unit: 'Kg',
    image: 'assets/images/products/product-04.jpg',
  ),
  Product(
    id: '5',
    name: 'Wagyu Beef Mess 1 Kg',
    category: 'Meat',
    description:
        'Wagyu beef are the ultimate paste and canning meat. They are low in moisture with dense flesh, feew seeds, and rich, sweet flavor.',
    price: 59.84,
    discount: 15,
    stock: 10,
    unit: 'Kg',
    image: 'assets/images/products/product-05.jpg',
  ),
  Product(
    id: '6',
    name: 'Fresh Lacto Whole Chicken 1 Kg',
    category: 'Lacto',
    description:
        'Lacto whole chicken are the ultimate paste and canning meat. They are low in moisture with dense flesh, feew seeds, and rich, sweet flavor.',
    price: 28.72,
    discount: 10,
    stock: 25,
    unit: 'Kg',
    image: 'assets/images/products/product-06.jpg',
  ),
];
