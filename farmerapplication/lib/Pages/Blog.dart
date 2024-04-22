import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapplication/Services/Blog_database_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:farmerapplication/Models/BlogModel.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final BlogDatabaseServices _databaseServices = BlogDatabaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
      ),
      body: StreamBuilder<QuerySnapshot<Blog>>(
        stream: _databaseServices.getBlogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          List<QueryDocumentSnapshot<Blog>> blogs = snapshot.data!.docs;
          if (blogs.isEmpty) {
            return Center(child: Text('No New Blog'));
          }

          return ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              Blog blog = blogs[index].data();
              String blogID = blogs[index].id;
              return Card(
                child: ExpansionTile(
                  title: Text(
                    blog.Title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(blog.Subtitle),
                      Text(DateFormat("dd-MM-yyyy h:mm a")
                          .format(blog.createdOn.toDate())),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            blog.Title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            blog.Description,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
