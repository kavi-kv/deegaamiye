import 'package:deegaamiye_2/Src/Components/social_images.dart';
import 'package:deegaamiye_2/Src/Components/social_list_tiles.dart';
import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                height: 95,
              ),
              Text(
                "We're always here to answer any of your questions, and support of any kind.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SocialListiles(
                title: Text("Chat with Customer Support"),
                icon: Icon(Icons.chat),
              ),
              SizedBox(
                height: 40,
              ),
              SocialListiles(
                title: Text("Send Us an Email"),
                icon: Icon(Icons.email),
              ),
              SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  "Connect with us on:",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialImages(
                    imagePath: 'images/instagram.webp',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SocialImages(
                    imagePath: 'images/linkedin.webp',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SocialImages(
                    imagePath: 'images/pinterest.png',
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialImages(
                    imagePath: 'images/twitter.webp',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SocialImages(
                    imagePath: 'images/sm-icons-youtube.png',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
