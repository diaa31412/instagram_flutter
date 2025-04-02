import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/textFieldInput.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _bioontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _bioontroller.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              SizedBox(height: 64),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1742054294284-baa5691ede46?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyMnx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _userNameController,
                hintText: "Enter Your Name",
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: "Enter Your Email",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _passController,
                hintText: "Enter Your Password",
                textInputType: TextInputType.emailAddress,
                isPass: true,
              ),
              SizedBox(height: 24),
              TextFieldInput(
                textEditingController: _bioontroller,
                hintText: "Enter Your bio",
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 64),
              InkWell(
                child: Container(
                  child: Text('SignUp'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Flexible(flex: 2, child: Container()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Text("You have account?"),
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        "Sign in.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
