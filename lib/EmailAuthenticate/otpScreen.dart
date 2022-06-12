import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:primenumbertask/EmailAuthenticate/authentication.dart';
import 'package:primenumbertask/EmailAuthenticate/startPage.dart';

class OTPAuth extends StatefulWidget {
  const OTPAuth({ Key? key, required this.email, required this.pass }) : super(key: key);
final String email;
final String pass;
  @override
  State<OTPAuth> createState() => _OTPAuthState();
}

class _OTPAuthState extends State<OTPAuth> {
  final TextEditingController _otpcontroller = TextEditingController();

  // Declare the object
  late EmailAuth emailAuth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );
  }
   verify() {
    print(emailAuth.validateOtp(
        recipientMail: widget.email.toString(),
        userOtp: _otpcontroller.value.text));
  }
  @override
  Widget build(BuildContext context) {
    
  
    return Scaffold(
      body: Column(
        
        children: [
          
          Text("Enter 6 digit OTP",style: TextStyle(color: Color(0xFF09009B),fontSize: 20),),
          SizedBox(height: 30,),
//           TextField(
// controller: _otpcontroller,
//           ),
TextFormField(
  controller: _otpcontroller,
            // initialValue: 'Input text',
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Enter OTP ',
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
           
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0xFF09009B),
                
                  shape: RoundedRectangleBorder(
                    
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              child: Text(
                'Verify',
                style: TextStyle(fontSize: 24),
              ),
            
            onPressed: (){
            verify();
            print("Verifff");
            print(emailAuth.validateOtp(
        recipientMail: widget.email.toString(),
        userOtp: _otpcontroller.value.text));
            print("ended");
            if(emailAuth.validateOtp(
        recipientMail: widget.email.toString(),
        userOtp: _otpcontroller.value.text)== true){
AuthenticationHelper()
                      .signUp(email: widget.email, password: widget.pass)
                      .then((result) {
                        
                    if (result == null) {
                      
                   Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => InitialiserWidget()));
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
            else{
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Please enter correct OTP",
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
              print("INvalid ");
            }
             
            print("Verifying Here");
            print(_otpcontroller.text);
          },)
        ],
      ),
    );
  }
}