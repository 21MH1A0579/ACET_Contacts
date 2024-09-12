
import 'dart:io';
import 'package:aditya_contacts/widgets/constants.dart';
import 'package:aditya_contacts/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProfileUpdateScreen extends StatefulWidget {
  final DocumentSnapshot<Object?>? data; // Changed from Object? to Map<String, dynamic> for better handling
  final String? department;
  final DocumentSnapshot<Object?>? imagedata;
  final bool? IsAlreadyImage;
  final String? Username;
  const ProfileUpdateScreen({super.key, required this.data, required this.department, this.imagedata, required this.IsAlreadyImage, required this.Username});

  @override
  _ProfileUpdateScreenState createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  bool IsLoading=false;
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

  File? _pickedImg;

  Future<void> UploadImage() async {
    try {
      setState(() {
        IsLoading=true;
      });
      // Initialize Firebase if not already initialized (depends on how you've structured your app)
      await Firebase.initializeApp(); // Ensure Firebase is initialized

      FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: 'gs://aditya-ff271.appspot.com');
      final storageRef = storage.ref().child(widget.department!).child(
          '${widget.Username!}.jpg');
      if (_pickedImg == null) {
        print("No image selected.");
        return;
      }
      if(widget.IsAlreadyImage!)
      {
        try {
          storageRef.delete();
          await storageRef.putFile(_pickedImg!);
          final imageUrl = await storageRef.getDownloadURL();
          Map<String,dynamic>newimagedata;
          newimagedata={'imgurl':imageUrl};
          await FirebaseFirestore.instance.collection("imagedata").doc(
              widget.Username).update(newimagedata);

        }
        catch(e){
          setState(() {
            IsLoading=false;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error updating Image: $e'),backgroundColor: Colors.red,));
        }

      }else{
        setState(() {
          IsLoading=true;
        });
        await storageRef.putFile(_pickedImg!);
        final imageUrl = await storageRef.getDownloadURL();
        Map<String,dynamic>newinsertingimagedata;
        newinsertingimagedata={
          'empid':widget.Username,
          'imagepath':'${widget.department}/${widget.Username}.jpg',
          'imgurl':imageUrl
        };
        await FirebaseFirestore.instance.collection('imagedata').doc(widget.Username).set(newinsertingimagedata);

      }
    } catch (e) {
      setState(() {
        IsLoading=false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error Occurred:$e'),backgroundColor: Colors.red,));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "UPDATE PROFILE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: primarycolor,
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
                      UserImagePicker(
                        onPickImage: (e) {
                          _pickedImg=e;
                        },
                        bgimg: widget.IsAlreadyImage ?? false,
                        imgdata: widget.imagedata,
                      ),
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
                      Text('EmpId: ${widget.data?['EmpId'] ?? 'N/A'}', style: _infoTextStyle()),
                      Text('Designation: ${widget.data?['Designation'] ?? 'N/A'}', style: _infoTextStyle()),
                      Text('Gender: ${widget.data?['Gender'] ?? 'N/A'}', style: _infoTextStyle()),
                      Text('Department: ${widget.department ?? 'N/A'}', style: _infoTextStyle()),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _updateProfile,
                  icon: const Icon(Icons.save, color: Colors.white),
                  label: IsLoading?const Center(child: CircularProgressIndicator(color: Colors.white,),):const Text('Save Changes', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: primarycolor,
                  ),
                ),
              ),
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
    setState(() {
      IsLoading=true;
    });
    if(_pickedImg!=null)
    {
      UploadImage();
    }
    // Construct the updated data map
    Map<String, dynamic> updatedData = {
      'MobileNo': _mobileController.text,
      'EmailId': _emailController.text,
      'EmployeeName': _employeeNameController.text,
    };

    try {
      if (widget.data?['Designation']?.contains("HOD")) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection("HOD'S")
            .where('EmpId',isEqualTo: widget.Username)
            .get();
        final _hods = snapshot.docs.first;
        Map<String, dynamic> updatedHODsData = {
          'MobileNo': _mobileController.text,
          'EmailId': _emailController.text,
          'EmployeeName': _employeeNameController.text,
        };
        await FirebaseFirestore.instance
            .collection("HOD'S")
            .doc('${_hods.id}').update(updatedHODsData);
      }

      await FirebaseFirestore.instance
          .collection(widget.department!)
          .doc('${widget.data?['EmpId']} ')
          .update(updatedData);
      setState(() {
        IsLoading=false;
      });
      // Show a success message or navigate back
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully!'),backgroundColor: Colors.green,));
      Navigator.pop(context);
    } catch (e) {
      // Handle errors
      setState(() {
        IsLoading=false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error updating profile: $e'),backgroundColor: Colors.red,));
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
