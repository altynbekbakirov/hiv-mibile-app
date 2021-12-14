import 'package:HIVApp/components/app_bar_arrow_back.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackAppBar(
        text: 'about_app'.tr(),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Мобильное приложение разработано при финансовой и технической поддержке '
              'Ассоциации «Партнерская сеть», ПРООН/Глобальный Фонд, ЮНЭЙДС',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              'ЮНЭЙДС и ПРООН не гарантируют полноту и правильность'
              ' содержащейся в мобильном приложении информации и не несут ответственности за ущерб, '
              'связанный с ее использованием\n',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
                  'Контентная часть приложения осуществлена рабочей группой:\n'
                  '- Башмакова Лариса Николаевна, национальный эксперт ЮНЭЙДС\n'
                  '-  Новикова Екатерина, менеджер проекта Ассоциации «Партнерская сеть»\n'
                  '- Муктарбекова Бегимай, программный специалист Ассоциации «Партнерская сеть»\n'
                  'Техническая часть приложения разработна компаний Ulut soft\n',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 20),
            Container(
              child: Image.asset("assets/images/logo_about.png"),
            ),
          ],
        ),
      ),
    );
  }
}
