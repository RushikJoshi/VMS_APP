import 'package:flutter/material.dart';
import 'package:vms_app/shared_prefrence.dart';
import 'features/auth/presentation/pages/splash_screen.dart';
import 'core/dependency_injection/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ERP Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
    //home: const SplashScreen(),
     //home: CompanyAdminLayout(),
      home: SharedPrefrence(),
    );
  }
}
