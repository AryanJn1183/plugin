import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:plugin/screens/signin.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _register() async {
    final url = 'your_backend_register_url_here'; // Replace with your backend register URL
    final response = await http.post(
      Uri.parse(url),
      body: {
        'username': _usernameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      // Registration successful, navigate to home screen
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Registration failed, show error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to register. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390,844),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 150.h,),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      filled: true,
                      fillColor: Color(0xFFBDE9EB),
                      prefixIcon: Image.asset('assets/icons/user_logo.png',height: 10.h,width: 10.w,), // Username icon
                      // Add elevation and shadow color
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0.r),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0.r),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    
                    ),
                  ),
                  SizedBox(height: 5.0.h),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0.r),
                      ),
                      filled: true,
                      fillColor: Color(0xFFBDE9EB),
                      prefixIcon: Image.asset('assets/icons/email_logo.png',height: 10.h,width: 50.w,), // Email icon
                      // Add elevation and shadow color
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0.r),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0.r),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0.h),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0.r),
                      ),
                      filled: true,
                      fillColor: Color(0xFFBDE9EB),
                      prefixIcon: Image.asset('assets/icons/lock_logo.png',height: 10.h,width: 50.w,), // Password icon
                      // Add elevation and shadow color
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0.r),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0.r),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0.h),
                  ElevatedButton(
                    onPressed: _register,
                    child: Text('Register',style: TextStyle(fontSize: 18.sp,color: Colors.black,fontWeight: FontWeight.w800,),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF78C2C6),
                      shadowColor: Colors.black
                    )
                  ),
                  SizedBox(height: 5.0.h),
                  Text('or',textAlign: TextAlign.center,),
                  SizedBox(height: 8.0.h),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Handle Google sign up
                    },
                    icon: Image.asset('assets/icons/google_logo.png', width: 24.0.w, height: 24.0.h),
                    label: Text('Sign up with Google'),
                  ),
                  SizedBox(height: 5.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',),
                      SizedBox(width: 0.25.w,),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SigninScreen()),
                        );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue, // Text color
                        ),
                        child: Text('Login'),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0.h),
                  TextButton(
                    onPressed: () {
                      // Navigate to registration as station screen
                    },
                    child: Text('Register as Station?'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
