import 'package:flutter/material.dart';

import 'authentication.dart';
class ForPas extends StatefulWidget {
  const ForPas({ Key? key }) : super(key: key);

  @override
  State<ForPas> createState() => _ForPasState();
}

class _ForPasState extends State<ForPas> {
  final _formKey = GlobalKey<FormState>();
  String? forgotMail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Form(
        key: _formKey,
        child: 
      Column(
        children: [
          
          TextFormField(
             decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email ',
                    fillColor: Colors.grey[350],
                    filled: true,
                    // ignore: prefer_const_constructors
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
                    forgotMail = val;
              },
          ),
          SizedBox(height: 15),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 54,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Respond to button press

                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    AuthenticationHelper()
                        .resetPass(email: forgotMail)
                        .then((result) {
                      if (result == null) {
                        Navigator.pop(context);
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
                  'Forgot Password',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      )),
        
      ),
    );
  }
}