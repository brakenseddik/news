import 'package:flutter/material.dart';
import 'package:news/components/BlogTile.dart';
import 'package:news/helpers/news.dart';
import 'package:news/models/article.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  CategoryNews({@required this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  getCategoryNews() async {
    var newsClass = CategorieNews();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(
              Icons.four_k,
              color: Colors.white,
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Alpha',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return BlogTile(
                        title: articles[index].title,
                        description: articles[index].description,
                        image: articles[index].image,
                        url: articles[index].url,
                      );
                    },
                    itemCount: articles.length,
                  ),
                ),
              ),
            ),
    );
  }
}
