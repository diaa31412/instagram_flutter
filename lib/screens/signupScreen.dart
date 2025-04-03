import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/utils.dart';
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
  Uint8List? _image;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _bioontroller.dispose();
    _userNameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void SignUpUser() async {
    String res = await AuthMethod().signupUser(
      email: _emailController.text,
      password: _passController.text,
      userName: _userNameController.text,
      bio: _bioontroller.text,
      file: _image!,
    );
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
                  _image != null
                      ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                      : CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpwxCN33LtdMLbWdhafc4HxabqpaU0qVbDxQ&s',
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
                onTap: SignUpUser,
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
