import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 154, 180, 178),
          elevation: 0,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 130,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 105,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9EHCSxyu5CGknIbhjR_Zrti0M9ucmdTlgBx5vyhIwAl9Yk1GqAOCipRpj0_UVFfkApH4&usqp=CAU"), //NetworkImage
                  radius: 100,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Name: Alex',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                'Age: 32',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
