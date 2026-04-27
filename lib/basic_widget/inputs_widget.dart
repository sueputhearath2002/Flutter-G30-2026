import 'package:flutter/material.dart';

enum Option { apple, banana, orage }

class InputsWidget extends StatefulWidget {
  InputsWidget({super.key});

  @override
  State<InputsWidget> createState() => _InputsWidgetState();
}

class _InputsWidgetState extends State<InputsWidget> {
  final textController = TextEditingController();

  bool isEnable = true;
  double valueSlider = 0;
  String? valueDropDown;
  String selectedValue = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              RadioListTile(
                title: Text('Option A'),
                subtitle: Text('Option A'),
                value: 'A',
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
              RadioListTile(
                title: Text('Option B'),
                subtitle: Text('Option A'),
                value: 'B',
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),

              DropdownButton(
                dropdownColor: Colors.amber,
                value: valueDropDown,
                items: [
                  DropdownMenuItem(child: Text("Hello. 1234"), value: "1"),
                  DropdownMenuItem(child: Text("Hello. 23412"), value: "2"),
                  DropdownMenuItem(child: Text("Hello. 1234"), value: "3"),
                ],
                onChanged: (value) {
                  setState(() {
                    valueDropDown = value ?? "";
                  });
                  print(value);
                },
              ),
              Slider(
                thumbColor: Colors.blue,
                divisions: 10,
                activeColor: Colors.red,
                label: "Slider",
                value: valueSlider,
                onChanged: (r) {
                  setState(() {
                    valueSlider = r;
                  });
                  print("=====${r}");
                },
              ),
              //Skip =====
              // RadioGroup(
              //   groupValue: isEnable,
              //   onChanged: (value) {
              //     print(value);
              //     isEnable = value!;
              //   },
              //   child: Text("RadioGroup"),
              // ),
              // Radio(
              //   value: isEnable,
              //   onChanged: (value) {
              //     print("asdfasdfasd");
              //     setState(() {
              //       isEnable = value!;
              //     });
              //   },
              // ),
              CheckboxListTile.adaptive(
                title: Text(
                  "Dark Mode",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("Dark Mode", style: TextStyle(fontSize: 13)),
                value: isEnable,
                onChanged: (value) {
                  setState(() {
                    isEnable = value!;
                  });
                },
              ),
              Checkbox(
                value: isEnable,
                onChanged: (value) {
                  setState(() {
                    isEnable = value!;
                  });
                },
              ),
              SwitchListTile(
                title: Text(
                  "Dark Mode",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text("Dark Mode", style: TextStyle(fontSize: 13)),
                value: isEnable,
                onChanged: (value) {
                  setState(() {
                    isEnable = value;
                  });
                },
              ),
              Switch.adaptive(
                value: isEnable,
                onChanged: (value) {
                  setState(() {
                    isEnable = value;
                  });
                },
              ),
              Switch(
                value: isEnable,
                onChanged: (value) {
                  setState(() {
                    isEnable = value;
                  });
                },
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(),
                readOnly: false,
                controller: textController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.withValues(alpha: 0.3),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.percent),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: Text("Password"),
                  hintText: "Please input password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.black, width: 3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
