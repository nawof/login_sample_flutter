import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: Colors.grey[800],
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
          ),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.grey[800],
          width: 250,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.deepPurpleAccent,
              width: 1.2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          outlineBorder: const BorderSide(
            color: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              Color.fromARGB(255, 121, 49, 255),
            ),
            minimumSize: const MaterialStatePropertyAll(
              Size(
                double.maxFinite,
                56,
              ),
            ),
            shadowColor: const MaterialStatePropertyAll(
              Colors.deepPurple,
            ),
            elevation: const MaterialStatePropertyAll(10),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          selectedIconTheme: IconThemeData(
            color: Colors.grey,
            opacity: 0.8,
          ),
        ),
      );

  // static ThemeData get redTheme => ThemeData(
  //       scaffoldBackgroundColor: Colors.red[100],
  //       textTheme: const TextTheme(
  //         bodyMedium: TextStyle(
  //           color: Colors.black,
  //         ),
  //       ),
  //       drawerTheme: DrawerThemeData(backgroundColor: Colors.red[400]),
  //       inputDecorationTheme: InputDecorationTheme(
  //         labelStyle: const TextStyle(color: Colors.white),
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.white,
  //           ),
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.white,
  //           ),
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         border: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.white,
  //           ),
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         outlineBorder: const BorderSide(
  //           color: Colors.white,
  //         ),
  //       ),
  //       appBarTheme: const AppBarTheme(
  //         centerTitle: true,
  //         backgroundColor: Colors.red,
  //       ),
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //         style: ButtonStyle(
  //           backgroundColor: const MaterialStatePropertyAll(
  //             Color.fromARGB(255, 17, 17, 17),
  //           ),
  //           minimumSize: const MaterialStatePropertyAll(
  //             Size(
  //               double.maxFinite,
  //               56,
  //             ),
  //           ),
  //           shadowColor: const MaterialStatePropertyAll(
  //             Colors.grey,
  //           ),
  //           elevation: const MaterialStatePropertyAll(5),
  //           shape: MaterialStatePropertyAll(
  //             RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(16),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );

  // static ThemeData get blueTheme => ThemeData(
  //       scaffoldBackgroundColor: Colors.blue[100],
  //       textTheme: const TextTheme(
  //         bodyMedium: TextStyle(
  //           color: Colors.black,
  //         ),
  //       ),
  //       drawerTheme: DrawerThemeData(backgroundColor: Colors.blue[400]),
  //       inputDecorationTheme: InputDecorationTheme(
  //         labelStyle: const TextStyle(color: Colors.white),
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.black,
  //           ),
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.red,
  //           ),
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         border: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.white,
  //           ),
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         outlineBorder: const BorderSide(
  //           color: Colors.white,
  //         ),
  //       ),
  //       appBarTheme: const AppBarTheme(
  //         centerTitle: true,
  //         backgroundColor: Colors.blue,
  //       ),
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //         style: ButtonStyle(
  //           backgroundColor: const MaterialStatePropertyAll(
  //             Color.fromARGB(255, 0, 87, 250),
  //           ),
  //           minimumSize: const MaterialStatePropertyAll(
  //             Size(
  //               double.maxFinite,
  //               56,
  //             ),
  //           ),
  //           shadowColor: const MaterialStatePropertyAll(
  //             Colors.grey,
  //           ),
  //           elevation: const MaterialStatePropertyAll(5),
  //           shape: MaterialStatePropertyAll(
  //             RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(16),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );

  // static ThemeData get greenTheme => ThemeData(
  //       scaffoldBackgroundColor: Colors.green[100],
  //       textTheme: const TextTheme(
  //         bodyMedium: TextStyle(
  //           color: Colors.black,
  //         ),
  //       ),
  //       drawerTheme: DrawerThemeData(backgroundColor: Colors.green[400]),
  //       inputDecorationTheme: InputDecorationTheme(
  //         labelStyle: const TextStyle(color: Colors.white),
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.white,
  //           ),
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.white,
  //           ),
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         border: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.white,
  //           ),
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         outlineBorder: const BorderSide(
  //           color: Colors.white,
  //         ),
  //       ),
  //       appBarTheme: const AppBarTheme(
  //         centerTitle: true,
  //         backgroundColor: Colors.green,
  //       ),
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //         style: ButtonStyle(
  //           backgroundColor: const MaterialStatePropertyAll(
  //             Color.fromARGB(255, 17, 17, 17),
  //           ),
  //           minimumSize: const MaterialStatePropertyAll(
  //             Size(
  //               double.maxFinite,
  //               56,
  //             ),
  //           ),
  //           shadowColor: const MaterialStatePropertyAll(
  //             Colors.grey,
  //           ),
  //           elevation: const MaterialStatePropertyAll(5),
  //           shape: MaterialStatePropertyAll(
  //             RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(16),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
}
