import 'package:HIVApp/model/user.dart';
import 'package:flutter/cupertino.dart';

class UserDataProvider extends InheritedWidget {
  final User data;
  UserDataProvider({
    Widget child,
    this.data,
  }) : super(child: child);
  @override
  bool updateShouldNotify(UserDataProvider old) => data != old.data;
  static UserDataProvider of(BuildContext context) =>         context.inheritFromWidgetOfExactType(UserDataProvider);
}