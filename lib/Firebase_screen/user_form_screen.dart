import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Firebase_screen/user_model.dart';
import 'package:flutter2026/Firebase_screen/user_service.dart';
import 'package:flutter2026/constant/colors.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key, this.user});
  final UserModel? user;

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameUser = TextEditingController();

  TextEditingController emailUser = TextEditingController();

  TextEditingController avatarUser = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    nameUser.text = widget.user?.name ?? "";
    emailUser.text = widget.user?.email ?? "";
    avatarUser.text = widget.user?.avatar ?? "";
    super.initState();
  }

  Future<void> _submitUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final userModel = UserModel(
        id: widget.user?.id ?? "",
        name: nameUser.text.trim(),
        email: emailUser.text.trim(),
        avatar: avatarUser.text.trim(),
      );

      if (widget.user == null) {
        await UserService.creatUser(userModel);
        _showSnackBar("User create successfully!", Colors.green);
      } else {
        await UserService.updateUser(userModel);
        _showSnackBar("User Update successfully!", Colors.deepOrange);
      }

      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      _showSnackBar("Error : $e", Colors.red);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  String titleUpdate() {
    if (widget.user != null) {
      return "Update User";
    }
    return "Create User";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titleUpdate())),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _buildAvatar(),
            SizedBox(height: 32),
            TextFormField(
              controller: avatarUser,
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? "Avatar URL is required"
                  : null,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                filled: true,

                prefixIcon: Icon(Icons.person),
                // suffixIcon: Icon(Icons.percent),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text("Avatar URL"),
                hintText: "Example -------",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: nameUser,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? "Name is required" : null,
              decoration: InputDecoration(
                filled: true,

                prefixIcon: Icon(Icons.person),
                // suffixIcon: Icon(Icons.percent),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text("User Name"),
                hintText: "Please input User Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: emailUser,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? "Email is required" : null,
              decoration: InputDecoration(
                filled: true,

                prefixIcon: Icon(Icons.email),
                // suffixIcon: Icon(Icons.percent),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text("Email"),
                hintText: "Please input email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _submitUser();
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                widget.user != null ? ColorStyle.mainColor : Colors.deepOrange,
              ),
            ),
            child: _isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.white))
                : Text(
                    titleUpdate(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    final url = avatarUser.text.trim();
    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.grey,
      child: url.isEmpty
          ? Icon(Icons.person, size: 80, color: Colors.grey.shade200)
          : CircleAvatar(
              child: CachedNetworkImage(
                imageUrl: url,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
    );
  }
}
