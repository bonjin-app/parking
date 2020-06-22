import 'package:parking/models/article_image.dart';

class Article {
  String subject;
  String price;
  String description;

  String imageUrl;

  Article({
    this.subject,
    this.price,
    this.description,

    this.imageUrl,
  });
}