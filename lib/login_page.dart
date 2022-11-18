import 'package:flutter/material.dart';
import 'package:vapp/util/route.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   final _formKey = GlobalKey<FormState>();
   moveToHome(BuildContext context) async{

    if(_formKey.currentState!.validate()){

      Navigator.pushNamed(context, MyRoute.homeRoute);
    }


   }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("images/login_page.png",fit: BoxFit.cover,
              height: 210,),
              SizedBox(
                height: 10,
              ),

              Text("Login Here",
              style: TextStyle(
                fontSize: 28,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),),

              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "enter user name",
                        labelText: "user name",
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "user name can not be empty";
                        }
                        return null;
                      },
                    ),
                    
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "password",
                        hintText: "enter password",
                      ),

                        validator: (value) {
                        if(value!.isEmpty){
                          return "password can not be empty";
                        }
                        else if(value.length<6){
                          return "password minimum 6 no ka ho ";
                        }
                        return null;
                      },
                      
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(onPressed: ()=>moveToHome(context),
                     child: Text("login"),
                     style: TextButton.styleFrom(minimumSize: Size(90, 40))

                     ,)
                  ],
                ),
              )
              
              
              

            ],
          ),
        ),
      )
    );
  }
}