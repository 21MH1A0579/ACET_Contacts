import 'dart:ffi';

import 'package:aditya_contacts/screens/Admin.dart';
import 'package:aditya_contacts/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileUpdateScreen extends StatefulWidget {
  final DocumentSnapshot<Object?>? data; // Changed from Object? to Map<String, dynamic> for better handling
  final String? department;
  final DocumentSnapshot<Object?>? imagedata;
  final bool? IsImage;

  ProfileUpdateScreen({super.key, required this.data, required this.department, this.imagedata, required this.IsImage});

  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  // Controllers for editable fields
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _employeeNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with data
    _mobileController.text = widget.data?['MobileNo'] ?? '';
    _emailController.text = widget.data?['EmailId'] ?? '';
    _employeeNameController.text = widget.data?['EmployeeName'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // UserImagePicker(onPickImage: (e){},bgimg:widget.IsImage,imgdata:widget),
                      _buildTextField(
                        controller: _mobileController,
                        label: 'Mobile Number',
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 12),
                      _buildTextField(
                        controller: _emailController,
                        label: 'Email ID',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 12),
                      _buildTextField(
                        controller: _employeeNameController,
                        label: 'Employee Name',
                        icon: Icons.person,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Non-editable Information',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      Text('EmpId: ${widget.data?['EmpId']}', style: _infoTextStyle()),
                      Text('Designation: ${widget.data?['Designation']}', style: _infoTextStyle()),
                      Text('Gender: ${widget.data?['Gender']}', style: _infoTextStyle()),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _updateProfile,
                  icon: const Icon(Icons.save,color: Colors.white,),
                  label: const Text('Save Changes',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ),
              
              Text(widget.imagedata!.data().toString()+widget.IsImage.toString())
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  TextStyle _infoTextStyle() {
    return const TextStyle(
      fontSize: 16,
      color: Colors.black54,
    );
  }

  void _updateProfile() async {
    // Construct the updated data map
    Map<String, dynamic> updatedData = {
      'MobileNo': _mobileController.text,
      'EmailId': _emailController.text,
      'EmployeeName': _employeeNameController.text,
    };

    try {
      // Update Firestore document using department and EmpId
      await FirebaseFirestore.instance
          .collection(widget.department!)
          .doc('${widget.data?['EmpId']} ')
          .update(updatedData);

      // Show a success message or navigate back
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully!')));
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AdminLoginPage()));
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error updating profile: $e')));
    }
  }

  @override
  void dispose() {
    // Dispose controllers
    _mobileController.dispose();
    _emailController.dispose();
    _employeeNameController.dispose();
    super.dispose();
  }
}
