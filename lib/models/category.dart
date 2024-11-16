class Category {
  final String name;
  final String productCount;
  final String thumbnailImage;

  Category({
    required this.name,
    required this.productCount,
    required this.thumbnailImage,
  });
}

final categories = [
  Category(
    name: 'T-SHIRT',
    productCount: '300',
    thumbnailImage: 'assets/images/1.PNG',
  ),
  Category(
    name: 'SHOES',
    productCount: '400',
    thumbnailImage: 'assets/images/1.PNG',
  ),
  Category(
    name: 'HODDIE',
    productCount: '120',
    thumbnailImage: 'assets/images/1.PNG',
  ),
  Category(
    name: 'JEANS',
    productCount: '500',
    thumbnailImage: 'assets/images/1.PNG',
  ),
  Category(
    name: 'GLOVES',
    productCount: '100',
    thumbnailImage: 'assets/images/1.PNG',
  ),
  Category(
    name: 'SOCKS',
    productCount: '120',
    thumbnailImage: 'assets/images/1.PNG',
  ),
];
