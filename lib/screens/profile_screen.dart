import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_api_app/screens/login_screen.dart';
import 'package:flutter_weather_api_app/utils/validators.dart';
import 'package:flutter_weather_api_app/widgets/custom_text_form_field_widget.dart';
import 'package:flutter_weather_api_app/widgets/profile_image_picker_widget.dart';

import 'package:flutter_weather_api_app/src/constants.dart' as constants;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  DateTime? _dob;
  String _profileImageUrl = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot doc =
            await _firestore.collection('users').doc(user.uid).get();

        if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          setState(() {
            _nameController.text = data['name'] ?? '';
            _bioController.text = data['bio'] ?? '';

            _profileImageUrl = data['profileImageUrl'] ?? '';
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading user data: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'name': _nameController.text,
          'bio': _bioController.text,
          'dob': _dob,
          'profileImageUrl': _profileImageUrl,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _uploadImageToStorage(File image) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) throw Exception('No user logged in');

      Reference ref =
          _storage.ref().child('profile_images').child('${user.uid}.jpg');

      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;

      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      setState(() {
        _profileImageUrl = downloadUrl;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.solidDarkPurple,
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          InkWell(
              onTap: () {
                _auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              )),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileImagePickerWidget(
                      imageUrl: _profileImageUrl,
                      onImageSelected: _uploadImageToStorage,
                    ),
                    const SizedBox(height: 24),
                    CustomTextFormFieldWidget(
                      controller: _nameController,
                      label: 'Name',
                      validator: Validators.nameValidation,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormFieldWidget(
                      controller: _bioController,
                      label: 'Bio',
                      maxLines: 3,
                      validator: Validators.bioValidation,
                    ),
                    const SizedBox(height: 24),
                    Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 50,
                          decoration: BoxDecoration(
                            color: constants.solidPurple,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              _updateProfile();
                            },
                            child: const Center(
                              child: Text(
                                'Update Profile',
                                style: TextStyle(
                                    color: constants.solidLightPurple,
                                    fontFamily: 'Poppins',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                  ],
                ),
              ),
            ),
    );
  }
}