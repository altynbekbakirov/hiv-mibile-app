import 'package:flutter/cupertino.dart';

class EmptyPage extends StatefulWidget {
  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> with AutomaticKeepAliveClientMixin<EmptyPage>  {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView();
  }

  @override
  bool get wantKeepAlive => true;
}
