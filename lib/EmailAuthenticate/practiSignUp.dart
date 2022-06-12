import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

import 'otpScreen.dart';
class Prac extends StatefulWidget {
  const Prac({Key? key}) : super(key: key);

  @override
  State<Prac> createState() => _PracState();
}

class _PracState extends State<Prac> {
  final _formKey = GlobalKey<FormState>();
     String? name;
     String? email;
      String? password;
  bool _obscureText = false;
  bool submitValid = false;
  bool agree = false;
 late EmailAuth emailAuth;
  final pass = new TextEditingController();
  
   @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );

    /// Configuring the remote server
    /// 
    //emailAuth.config(remoteServerConfiguration);
    
  }
   void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: email.toString(), otpLength: 5);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin:EdgeInsets.only(left: 15,right:15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold,color: Color(0xFF09009B),letterSpacing: 5),
            ),
  
              Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(   fillColor: Colors.grey[350],
                filled: true,
                labelText: 'Full name',
                prefixIcon: Icon(Icons.account_circle),
                border: OutlineInputBorder(
              borderSide: BorderSide.none,
              
              borderRadius: BorderRadius.all(
          const Radius.circular(10.0),
              ),
            )
                           ),
                           onSaved: (val) {
                name = val;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some name';
                }
                return null;
              },
                  ),
                  SizedBox(height: 10,),
                   // email
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: 'Email',
                  fillColor: Colors.grey[350],
                filled: true,
                   border: OutlineInputBorder(
              borderSide: BorderSide.none,
              
              borderRadius: BorderRadius.all(
          const Radius.circular(10.0),
              ),
            )
                  ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (val) {
                email = val;
                print(email); 
              },
              keyboardType: TextInputType.emailAddress,
            ),
              SizedBox(height: 10,),
             // password
            TextFormField(
              controller: pass,
              decoration: InputDecoration(
                labelText: 'Password',
                fillColor: Colors.grey[350],
                filled: true,
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
              onSaved: (val) {
                password = val;
              },
              obscureText: !_obscureText,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 10,),
             // confirm passwords
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                fillColor: Colors.grey[350],
                filled: true,
                prefixIcon: Icon(Icons.lock_outline),
               border: OutlineInputBorder(
              borderSide: BorderSide.none,
              
              borderRadius: BorderRadius.all(
          const Radius.circular(10.0),
              ),
            ),
              ),
              obscureText: true,
              validator: (value) {
                if (value != pass.text) {
                  return 'password not match';
                }
                return null;
              },
            ),
            SizedBox(height: 10,),
             // name
            
            Row(
              children: <Widget>[
                Checkbox(
                  onChanged: (_) {
                    setState(() {
                      agree = !agree;
                    });
                  },
                  value: agree,
                ),
                Flexible(
                  child: Text(
                      'By creating account, I agree to Terms & Conditions and Privacy Policy.'),
                ),
              ],
            ),
        
            SizedBox(
              height: 10,
            ),
        
            // signUP button
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                   _formKey.currentState!.save();
                    sendOtp();
                   Navigator.pushReplacement(context,
                             MaterialPageRoute(builder: (context) => OTPAuth(email: email.toString(), pass: password.toString(),)));
                    
                   
                     
                     print(email);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF09009B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                child: Text('Sign Up'),
              ),
            ),
                  ]
                  )
                  ),
            ],
          ),
        ),
      ),
    );
  }
}