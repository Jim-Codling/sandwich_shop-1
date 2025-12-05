import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/widgets/app_header.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppHeader(title: 'Sandwich Shop'),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to Sandwich Shop!', style: heading2),
            SizedBox(height: 20),
            Text(
              'We are a family-owned business dedicated to serving the best sandwiches in town. ',
              style: normalText,
            ),
          ],
        ),
      ),
    );
  }
}
