import 'package:crud/widgets/user_data.dart';
import 'package:flutter/material.dart';

class PersonRegInherited extends InheritedWidget {
  final Widget child;
  PersonRegInherited({super.key, required this.child}) : super(child: child);

  

  final List<Person> listReg = [
    // Person('John Doe',' 1990', 'johndoe@example.com',' 123456789', 'New York', 'NY', 'password123'),
  ];

  void newReg(String name, int dateBirth, String email, int phone, String city, String  state, String password) {
    listReg.add(Person(name, dateBirth, email, phone, city, state, password),);
  }

  static PersonRegInherited of(BuildContext context) {
    final PersonRegInherited? result =
        context.dependOnInheritedWidgetOfExactType<PersonRegInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PersonRegInherited oldWidget) {
    return oldWidget.listReg != listReg;
  }
  
}
