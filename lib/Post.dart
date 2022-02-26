class Post{
final String uname;
final String imgU;
final String imgPost;
final String content;
final Map<String,String> comment ;
final List<String> addComment;
bool isLike;
Post({
required this.uname,
required this.imgU,
required this.imgPost,
required this.content,
  required this.comment,
  required this.isLike,
  required this.addComment
});
}