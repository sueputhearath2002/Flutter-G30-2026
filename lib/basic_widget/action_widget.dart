//Alert Dialog , showModalBottomSheet sheet , snackbar

import 'package:flutter/material.dart';

class ActionWidget extends StatefulWidget {
  const ActionWidget({super.key});

  @override
  State<ActionWidget> createState() => _ActionWidgetState();
}

class _ActionWidgetState extends State<ActionWidget> {
  //Snackbar
  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Save successfully"),
        action: SnackBarAction(
          label: "UNDO",
          onPressed: () {
            print("Undo click");
          },
        ),
      ),
    );
  }

  //Show Alert Dialog
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Item"),
          content: Text("Are you sure you want to delete?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                showSnackbar();
              },
              child: Text("Delete", style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  //ShowModalBottomSheet
  void showBottom(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Action",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Wrap(
                children: [
                  ListTile(
                    iconColor: Colors.red,
                    leading: Icon(Icons.delete),
                    title: Text("Delete"),
                    onTap: () {
                      Navigator.of(context).pop();
                      showAlert(context);
                    },
                  ),
                  ListTile(
                    iconColor: Colors.blue,
                    leading: Icon(Icons.save),
                    title: Text("Save"),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print("====asdfasd=");
            showBottom(context);
          },
          child: Text("Open Actions"),
        ),
      ),
    );
  }
}
