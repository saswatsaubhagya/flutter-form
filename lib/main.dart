import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String userText = "";
  String email = "";
  String password = "";
  TextEditingController _userText = TextEditingController(text: "");
  var _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(
      child: Text("One"),
    ),
    DropdownMenuItem(
      child: Text("Two"),
    ),
    DropdownMenuItem(
      child: Text("Three"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextFormField(
                //controller: _userText,
                decoration: InputDecoration(
                  //hintText: "Enter your Name",
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // filled: true,
                  // fillColor: Colors.green,
                ),
                maxLength: 100,
                cursorColor: Colors.red,
                //enabled: false,
                // onTap: () {
                //   print("tapped");
                // },
                onChanged: (value) {
                  //userText = value;
                },
                onSaved: (value) => email = value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => v.isEmpty ? "Please Enter the email" : null,
              ),
              TextFormField(
                //controller: _userText,
                decoration: InputDecoration(
                  //hintText: "Enter your Name",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // filled: true,
                  // fillColor: Colors.green,
                ),
                maxLength: 100,
                cursorColor: Colors.red,
                //enabled: false,
                // onTap: () {
                //   print("tapped");
                // },
                onChanged: (value) {
                  //userText = value;
                },
                onSaved: (value) => password = value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => v.isEmpty
                    ? "Please Enter the password"
                    : v.length < 6
                        ? "Password must be 6 character length"
                        : null,
              ),
              //show the text of textbox/ textfield
              RaisedButton(
                onPressed: () {
                  //print(_userText.text);
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print(
                        "user entered email id $email and password $password");
                  }
                  return;
                },
                child: Text("Show Text"),
              ),
              // RaisedButton(
              //   onPressed: () {
              //     //userText = "";
              //     _userText.clear();
              //   },
              //   child: Text("Clear"),
              // ),
              // Row(
              //   children: [
              //     Radio(
              //       value: "saswat",
              //       groupValue: "saswat",
              //       onChanged: (value) {},
              //     ),
              //     Text("Saswat")
              //   ],
              // ),
              // Checkbox(
              //   value: true,
              //   onChanged: (value) {},
              // ),
              // DropdownButton(
              //   onChanged: (String value) {},
              //   items: items,
              // ),
              // Switch(
              //   value: true,
              //   onChanged: (value) {},
              // ),
              // Slider(
              //   value: 2.0,
              //   onChanged: (value) {},
              //   min: 1,
              //   max: 5,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
