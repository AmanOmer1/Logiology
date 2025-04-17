import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logiology/Controller/AuthController.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  File? _image;
  final _pickImages = ImagePicker();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _pickImageFrom(ImageSource source) async {
    final imagePicked = await _pickImages.pickImage(source: source);
    if (imagePicked != null) {
      setState(() => _image = File(imagePicked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "Your Profile",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: Colors.indigo.shade800,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.grey.shade600),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () => _showImageSourceBottomSheet(context),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      child:
                          _image == null
                              ? Icon(
                                Icons.person_outline,
                                size: 60,
                                color: Colors.grey.shade600,
                              )
                              : null,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => _showImageSourceBottomSheet(context),
                      child: Container(
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade400,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(Icons.edit, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            TextFormField(
              controller: _userNameController,
              style: GoogleFonts.montserrat(),
              decoration: InputDecoration(
                labelText: 'Change Username',
                labelStyle: TextStyle(color: Colors.grey.shade600),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.indigo.shade400,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              style: GoogleFonts.montserrat(),
              decoration: InputDecoration(
                labelText: 'Change Password',
                labelStyle: TextStyle(color: Colors.grey.shade600),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.indigo.shade400,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade500,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                textStyle: GoogleFonts.montserrat(fontSize: 18),
              ),
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageSourceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  _pickImageFrom(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
                onTap: () {
                  _pickImageFrom(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.delete_forever_outlined),
                title: Text('Remove Current Photo'),
                onTap: () {
                  setState(() {
                    _image = null;
                  });
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
