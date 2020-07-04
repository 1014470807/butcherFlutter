
class Article {
  String id;
  String articleTitle;
  String articleContent;
  String createtime;
  String articleTime;
  String articleTag;

  static Article fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Article articleBean = Article();
    articleBean.id = map['id'];
    articleBean.articleTitle = map['article_title'];
    articleBean.articleContent = map['article_content'];
    articleBean.createtime = map['createtime'];
    articleBean.articleTime = map['article_time'];
    articleBean.articleTag = map['article_tag'];
    return articleBean;
  }

  Map toJson() => {
    "id": id,
    "article_title": articleTitle,
    "article_content": articleContent,
    "createtime": createtime,
    "article_time": articleTime,
    "article_tag": articleTag,
  };
}