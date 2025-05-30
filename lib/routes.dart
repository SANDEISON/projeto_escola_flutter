import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/coordinator_screen.dart';
import 'screens/teacher_screen.dart';
import 'screens/student_screen.dart';
import 'screens/grades_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/coordinator':
        return MaterialPageRoute(builder: (_) => CoordinatorScreen());
      case '/teacher':
        return MaterialPageRoute(builder: (_) => TeacherScreen());
      case '/student':
        return MaterialPageRoute(builder: (_) => StudentScreen());
      case '/grades':
        return MaterialPageRoute(builder: (_) => GradesScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
