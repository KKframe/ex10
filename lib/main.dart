import 'package:ex10/Post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodstagram',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listCm = [];
  String path = 'assets/images/';
  String input = '';
  List<Post> p = [
    Post(
      uname: 'kkfrxme',
      imgU: 'u1.jpg',
      imgPost: 'img1.jpg',
      content: 'Would you be my strawberries cheese pie?',
      comment: {'Lisa': 'น่ารักจังเลย 💗', 'Jennie': 'งู้ยยย 😍😍😍'},
      isLike: false,
      addComment: [],
    ),
    Post(
      uname: 'MissKhiew',
      imgU: 'u2.jpg',
      imgPost: 'img2.jpg',
      content: 'My first meal of day :)',
      comment: {'Jisoo': 'ขอชิมมั่งดิ5555', 'Rose': 'น่ากินจังง 😋'},
      isLike: false,
      addComment: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Foodstagram",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontFamily: 'FC Friday',
        ),
      )),
      body: ListView.builder(
          itemCount: p.length,
          itemBuilder: (context, index) {
            var item = p[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: myPost(item),
            );
          }),
    );
  }

  Card myPost(Post item) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(path + item.imgU),
                    radius: 20.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(item.uname),
                  Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert_outlined,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              path + item.imgPost,
              alignment: Alignment.center,
            ),
            SizedBox(
              width: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('${item.content}'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  for (var i = 0; i < item.comment.length; i++)
                    commented(item, i),
                  if (item.addComment.length > 0)
                    for (var j = 0; j < item.addComment.length; j++)
                      Row(
                        children: [
                          Text(
                            'flutter',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            ' ${item.addComment.elementAt(j)}',
                          ),
                        ],
                      ),
                  SizedBox(
                    height: 10,
                  ),
                  rowLikeAndComment(item)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row rowLikeAndComment(Post item) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (item.isLike == false) {
                item.isLike = true;
              } else {
                item.isLike = false;
              }
              //print(isLike);
            });
          },
          icon: (item.isLike)
              ? Icon(
                  Icons.favorite_outlined,
                  color: Colors.red,
                )
              : Icon(
                  Icons.favorite_border_outlined,
                ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (String txt) {
                setState(() {
                  item.addComment.add(txt);
                });
              },
              decoration: InputDecoration(
                hintText: 'Add a comment',
              ),
            ),
          ),
        )
      ],
    );
  }

  Row commented(Post item, int i) {
    return Row(
      children: [
        Text(
          '${item.comment.keys.elementAt(i)}',
          style:
              TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500),
        ),
        Text(
          ' ${item.comment.values.elementAt(i)}',
        ),
      ],
    );
  }
}
