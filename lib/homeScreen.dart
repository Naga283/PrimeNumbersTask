// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:primenumbertask/EmailAuthenticate/authentication.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
   
    String? r;
    String? r3;
    String? r1;
    String? r2;
    bool isvis = false;
  
    String? checkPrime(int num){
   int i,m=0,flag=0;
 
  m=num~/2;
  for(i = 2;i<=m;i++){
    if(num%i == 0){
      r='$num is not a prime number';
      print('$num is not a prime number');
      flag=1;
      break;
    }
  }
  if(flag==0){
    print('$num is prime number');
    r ='$num is prime number';
  }
  return r;
}
  @override
  Widget build(BuildContext context) {
    TextEditingController num1 = TextEditingController();
    TextEditingController num2 = TextEditingController();
    TextEditingController num3 = TextEditingController();
    
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Xelopmoc technologies"),
        actions: [
          IconButton(onPressed: (){
          AuthenticationHelper().signOut();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text("Check Prime Numbers",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              TextFieldsForNumbers(num1: num1, text: 'Enter Number 1',),
              SizedBox(height: 20,),
              TextFieldsForNumbers(num1: num2, text: 'Enter Number 2',),
              SizedBox(height: 20,),
              TextFieldsForNumbers(num1: num3, text: 'Enter Number 3',),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
      
                setState(() {
                  if(isvis == false){
      
                  isvis = true;
                  }
                r3=  checkPrime(int.parse(num1.text));
                r1=  checkPrime(int.parse(num2.text));
                r2=  checkPrime(int.parse(num3.text));
                
                  
                });
                
              //  r=   checkPrime(int.parse(num2.text));
              //    r= checkPrime(int.parse(num3.text));
                
               
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                             color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          margin: EdgeInsets.only(right: 30,bottom: 30),
                  child: Text("Check"),
                ),
              ),
              Visibility(
                visible: isvis,
                child: Column(
                  children: [
                    Text(r3.toString()),
                Text(r1.toString()),
                Text(r2.toString()),
                  ],
                ),
              )
              
            ],
          )
        ),
      )
    );
    
  }
}

class TextFieldsForNumbers extends StatelessWidget {
  const TextFieldsForNumbers({
    Key? key,
    required this.num1, required this.text,
  }) : super(key: key);

  final TextEditingController num1;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: num1,
      decoration: InputDecoration(hintText: text,
       border: OutlineInputBorder(
        
               borderSide: BorderSide(
                width: 5.0
               ),
                borderRadius: BorderRadius.all(
                  const Radius.circular(10.0),
                ))
      ),
    );
  }
}