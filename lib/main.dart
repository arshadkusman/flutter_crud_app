import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'screens/user_list_screen.dart';
import 'screens/edit_user_screen.dart';
import 'screens/create_user_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider()..loadUsers(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.white))),
      title: 'User Management',
      initialRoute: '/',
      routes: {
        '/': (context) => const UserListScreen(),
        '/create': (context) => const CreateUserScreen(),
        '/edit': (context) => const EditUserScreen(), // Add this
      },
    );
  }
}
