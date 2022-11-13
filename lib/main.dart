import 'package:flutter/material.dart';

import 'App.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
/*
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/

  runApp(
      App());
}

