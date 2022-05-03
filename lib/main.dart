import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(FireBaseFlutter());
  });
}

class FireBaseFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: AppFlut(),
    );
  }
}

void getUsuario() async {
  List usuario = [];

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("usuarios");
  QuerySnapshot usuarios = await collectionReference.get();
  if (usuarios.docs.isNotEmpty) {
    for (var docu in usuarios.docs) {
      usuario.add(docu.data());
      print(docu.data());
    }
  }
}

class AppFlut extends StatefulWidget {
  @override
  State<AppFlut> createState() => _AppFlutState();
}

class _AppFlutState extends State<AppFlut> {
  @override
  void initState() {
    super.initState();
    getUsuario();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: Text("Hola"),
      ),
    );
  }
}
