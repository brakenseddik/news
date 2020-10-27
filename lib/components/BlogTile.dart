import 'package:flutter/material.dart';
import 'package:news/views/article_page.dart';

class BlogTile extends StatelessWidget {
  final String title, description, image, url;
  BlogTile({this.title, this.description, this.image, this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Article(
                      Blogurl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Image.network(image),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              description,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
