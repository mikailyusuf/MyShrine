import 'package:flutter/material.dart';




class MyWebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        "/":(context) => SignUpScreen(),
        '/':(context) => SignUpScreen(),

      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  double _formProgress = 0;
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: updateForm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress,),
          Text("SIGN UP FORM",style: Theme.of(context).textTheme.headline4,),
          Padding(padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(
                  hintText: "First Name"
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(
                  hintText: "Last Name"
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: "Email"
              ),
            ),
          ),
          FlatButton(
            onPressed: _formProgress == 1 ?_showWelcomeScreen:null,
            child: Text("SIGN UP"),
            color: Colors.blue,
          )

        ],
      ),

    );
  }
  void _showWelcomeScreen()
  {

    Navigator.of(context).pushNamed('\welcome');
  }

  void updateForm()
  {
    var progress = 0.0;
    var controllers = [_firstNameController,_lastNameController,_emailController];
    for(var controller in controllers)
    {
      if(controller.value.text.isNotEmpty)
      {
        progress+= 1/controllers.length;

      }
    }
    setState(() {
      _formProgress = progress;
    });

  }

}



