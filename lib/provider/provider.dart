// provider.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PrincipalDataProvider extends ChangeNotifier {
  Map<String, dynamic>? _textData;
  Map<String, dynamic>? _imgData;
  bool _isLoading = true;

  Map<String, dynamic>? get textData => _textData;
  Map<String, dynamic>? get imgData => _imgData;
  bool get isLoading => _isLoading;

  PrincipalDataProvider() {
    fetchPrincipalData();
  }

  Future<void> fetchPrincipalData() async {
    try {
      DocumentSnapshot snapshot1 = await FirebaseFirestore.instance
          .collection("principal")
          .doc("principal")
          .get();
      DocumentSnapshot snapshot2 = await FirebaseFirestore.instance
          .collection("imagedata")
          .doc("principal")
          .get();

      if (snapshot1.exists) {
        _textData = snapshot1.data() as Map<String, dynamic>?;
      } else {
        print("No data found in 'principal' document.");
      }

      if (snapshot2.exists) {
        _imgData = snapshot2.data() as Map<String, dynamic>?;
      } else {
        print("No data found in 'imagedata' document.");
      }
    } catch (e) {
      print('Failed to load data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}







class DeansDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _deans = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get deans => _deans;
  bool get isLoading => _isLoading;

  DeansDataProvider() {
    fetchDeansData();
  }

  Future<void> fetchDeansData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('deans')
          .orderBy('position')
          .get();
      _deans = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Failed to load data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}






class HodsDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _hods = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get hods => _hods;
  bool get isLoading => _isLoading;

  HodsDataProvider() {
    fetchHodsData();
  }

  Future<void> fetchHodsData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("HOD'S")
          .orderBy('Dept')
          .get();
      _hods = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Failed to load data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}







class CommitteeDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _committees = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get committees => _committees;
  bool get isLoading => _isLoading;

  CommitteeDataProvider() {
    fetchCommitteeData();
  }

  Future<void> fetchCommitteeData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Committee')
          .get();
      _committees = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Failed to load data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}









class IqacDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _iqacList = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get iqacList => _iqacList;
  bool get isLoading => _isLoading;

  IqacDataProvider() {
    fetchIqacData();
  }

  Future<void> fetchIqacData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('IQAC')
          .get();
      _iqacList = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Failed to load data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}











class TransportDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _transports = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get transports => _transports;
  bool get isLoading => _isLoading;

  TransportDataProvider() {
    fetchTransportData();
  }

  Future<void> fetchTransportData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("transport")
          .get();
      _transports = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Failed to load data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}




class SportsDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _sports = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get sports => _sports;
  bool get isLoading => _isLoading;

  SportsDataProvider() {
    fetchSportsData();
  }

  Future<void> fetchSportsData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("sports")
          .get();
      _sports = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Failed to load data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}


class EmergencyDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _emergencies = [];
  bool _isLoading = true;

  List<Map<String, dynamic>> get emergencies => _emergencies;
  bool get isLoading => _isLoading;

  EmergencyDataProvider() {
    fetchEmergencyData();
  }

  Future<void> fetchEmergencyData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("emergency")
          .get();
      _emergencies = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Failed to load data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
