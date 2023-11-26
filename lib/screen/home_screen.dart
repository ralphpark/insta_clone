import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children:[
          StoryArea(),
          FeedList(),
        ]

      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => UserStory(userName: 'User $index'),
        ),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;
  const UserStory({
    super.key, required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData({required this.userName, required this.likeCount,required this.content});
}

final feedDataList =[
  FeedData(userName: 'User 1', likeCount: 10, content: 'This is my first post!'),
  FeedData(userName: 'User 2', likeCount: 120, content: 'This is my sec post!'),
  FeedData(userName: 'User 3', likeCount: 1420, content: 'This is my fuck post!'),
  FeedData(userName: 'User 4', likeCount: 150, content: 'This is my ring post!'),
  FeedData(userName: 'User 5', likeCount: 160, content: 'This is my food post!'),
  FeedData(userName: 'User 6', likeCount: 170, content: 'This is my pee post!'),
  FeedData(userName: 'User 7', likeCount: 1230, content: 'This is my beach post!'),
  FeedData(userName: 'User 8', likeCount: 1450, content: 'This is my dog post!'),
  FeedData(userName: 'User 9', likeCount: 1320, content: 'This is my cat post!'),
  FeedData(userName: 'User 10', likeCount: 120, content: 'This is my clothe post!'),

];
class FeedList extends StatelessWidget {
  const FeedList({super.key});



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // 어느정도 스크롤이 불가능하도록 만드는 역할
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) {
        return  FeedItem(feedData : feedDataList[index]);
      },
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;
  const FeedItem({super.key, required this.feedData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(feedData.userName),
                ],
              ),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border_outlined),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.paperplane),
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.bookmark),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text('좋아요 ${feedData.likeCount} 개',style: TextStyle(fontWeight: FontWeight.bold),),
        ),
       ],
    );
  }
}


