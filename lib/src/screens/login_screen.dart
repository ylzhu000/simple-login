import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  Widget build(context) {
    return Container (
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              emailField(),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              submitButton()
            ],
          ),
        ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'yourname@example.com'
      ),
      validator: (String value) {
        // return null if valid, otherwise return error msg
        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
      },
      onSaved: (String value) {
        print('The email is $value');
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: (String value) {
        if (value.length < 7) {
          return 'Password must be at least 7 characters';
        }
      },
      onSaved: (value) {
        print('The password is $value');
      },
      obscureText: true,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Submitting..');
        }
      },
    );
  }
}