import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/components/BlogTile.dart';
import 'package:news/components/CategoryTile.dart';
import 'package:news/helpers/data.dart';
import 'package:news/helpers/news.dart';
import 'package:news/models/article.dart';
import 'package:news/models/category.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List<CategoryModel> categories = List<CategoryModel>();
  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading = true;

  getNews() async {
    var newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    categories = GetCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    //Categories
                    Container(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            photo: categories[index].imageAssetUrl,
                            name: categories[index].categorieName,
                          );
                        },
                        itemCount: categories.length,
                      ),
                    ),
                    //Blog
                    Container(
                      padding: EdgeInsets.only(top: 15),
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
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
