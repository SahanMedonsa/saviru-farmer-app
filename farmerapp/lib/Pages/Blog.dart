import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapp/Components/Colorpallet.dart';
import 'package:farmerapp/Models/BlogModel.dart';
import 'package:farmerapp/Services/Blog_database_service.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      backgroundColor: const Color.fromRGBO(34, 139, 34, 1).withOpacity(0.2),
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

          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                Blog blog = blogs[index].data();

                return Card(
                  child: ExpansionTile(
                      initiallyExpanded: index == 0,
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
            ),
          );
        },
      ),
    );
  }
}
