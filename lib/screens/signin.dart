import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final url = 'your_backend_login_url_here'; // Replace with your backend login URL
    final response = await http.post(
      Uri.parse(url),
      body: {
        'username': _emailController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Login failed, show error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to login. Please try again.'),
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
            padding: EdgeInsets.symmetric(horizontal: 32.0.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 250.h,),
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
                    onPressed: _login,
                    child: Text('Log In',style: TextStyle(fontSize: 18.sp,color: Colors.black,fontWeight: FontWeight.w800,),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
