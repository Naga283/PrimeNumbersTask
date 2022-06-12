// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:primenumbertask/EmailAuthenticate/practiSignUp.dart';
import 'package:primenumbertask/homeScreen.dart';

import 'authentication.dart';
import 'forPass.dart';



class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
               
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Welcome back!',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF09009B),letterSpacing: 5),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Sign in to continue',
                    style: TextStyle(fontSize: 24,color: Color(0xFF09009B),wordSpacing: 5,letterSpacing: 5),
                  ),
                ),
               
              ],
            ),
      
            // SizedBox(
            //   height: 50,
            // ),
    
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoginForm(),
            ),
      
            // SizedBox(height: 20),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
             
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, '/signup');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Prac()));
                  },
                  child: Text('Create a new Account',
                      style: TextStyle(fontSize: 20, color: Color(0xFF09009B))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


}

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email Or Username',
              fillColor: Colors.grey[350],
              filled: true,
              border: OutlineInputBorder(
                
                borderSide: BorderSide.none,

                borderRadius: BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
          ),
          SizedBox(
            height: 20,
          ),

          // password
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              fillColor: Colors.grey[350],
              filled: true,
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            obscureText: _obscureText,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Remember me",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForPas()));
            },
            child: Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF09009B),fontSize: 18),))
        ],
      ),
      SizedBox(height: 15),

          SizedBox(
            height: 54,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press

                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  AuthenticationHelper()
                      .signIn(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF09009B),
                
                  shape: RoundedRectangleBorder(
                    
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
