import 'package:HIVApp/components/bullet.dart';
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

/// Страница "Самотестирование на ВИЧ"
class HIVSelfTestScreen extends StatefulWidget {
  @override
  _HIVSelfTestScreenState createState() => _HIVSelfTestScreenState();
}

class _HIVSelfTestScreenState extends State<HIVSelfTestScreen> {
  double fontSize = 18;
  bool showSlider = false;

  Widget _appBarWithSizeSlider(BuildContext context) {
    return AppBar(
      leading: Container(),
      titleSpacing: 0.0,
      centerTitle: false,
      title: SliderTheme(
        data: SliderTheme.of(context).copyWith(trackHeight: 15),
        child: Slider(
          value: fontSize,
          min: 18,
          max: 24,
          divisions: 3,
          label: fontSize.round().toString(),
          onChanged: (value) {
            setState(() {
              fontSize = value;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle chapterStyle = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 10,
        fontWeight: FontWeight.w700);

    TextStyle contentItalic = TextStyle(
        color: Colors.black, fontSize: fontSize, fontStyle: FontStyle.italic);

    TextStyle contentNormal =
    TextStyle(color: Colors.black, fontSize: fontSize);

    TextStyle normalBold = TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w700);

    TextStyle normalBoldForChapter = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 6,
        fontWeight: FontWeight.w600);

    Widget _hivSelfTestingContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "Самотестированиена ВИЧ\n\n", style: chapterStyle),
              TextSpan(text: "Что такое самотест?\n\n", style: TextStyle(color: Colors.black, fontSize: fontSize + 6, fontWeight: FontWeight.bold)),
              TextSpan(text: "Самотестированиена ВИЧ", style: normalBold),
              TextSpan(
                text:" - это проведение тестирования на ВИЧ самостоятельно без участия медицинских работников. Тестирование "
                    "проводится по слюне. Это экспресс-тест, что позволяет узнать результат за 20 минут.\n",
                style: contentNormal,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Где можно получить самотест?\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                text: "Набор для самотестирования на ВИЧ можно получить в Республиканском Центре СПИД, скоро они появятся "
                    "во всех центрах СПИД или в некоторых НПО. Уже в 2021 году их можно будет также купить в аптеках.\n\n",
                style: contentNormal),
              TextSpan(
                  text: "Преимущества самотестирования на ВИЧ\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Самотестирование на ВИЧ является надежным и удобным методом для контроля своего ВИЧ-статуса. "
                      "Особенно это важно для лиц, которые практикуют опасное поведение, но не решаются обратиться в "
                      "медицинскую организацию. \n\n",
                  style: contentNormal),
              TextSpan(
                  text: "Где и когда Вы можете пройти самотестирование?\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Вы можете сами выбрать время и место для проведения теста. Вы можете проводить самотестирование "
                      "совместно с другом /подругой. По Вашему желанию можно пройти самотестирование на ВИЧ при поддержке "
                      "представителей НПО.\n\n",
                  style: contentNormal),
              TextSpan(
                  text: "Как работает самотест? \n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Этот тест, как и многие другие тесты, определяет в организме не вирус, а антитела - то есть белки, "
                      "которые вырабатываются при попадании вируса в организм.\n\n",
                  style: contentNormal),
              TextSpan(
                  text: "Что включает набор для самотестирования на ВИЧ?\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Набор для самотестирования на ВИЧ включает сам тест и приспособления для тестирования, а также "
                      "инструкцию о проведении тестирования; оценке результатов теса, а также рекомендации по более "
                      "безопасному поведению и презервативы.\n\n",
                  style: contentNormal),
              TextSpan(
                  text: "Как провести тест?\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Для этого нужно найти удобное место и время, чтобы Вам никто не помешал.   Сначала внимательно "
                      "прочитайте инструкцию. Подготовьте рабочее место и оборудование, как на рисунке. Для проведения "
                      "теста Вам нужно провести тестовой палочкой по верхней и нижней десне. После этого палочку помещаете "
                      "в прилагаемую баночку с жидкостью и ждете 20 минут.\n\n",
                  style: contentNormal),
            ]),
          ),
        ),
        Image.asset("assets/images/gradusnik.png"),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Оценка результата теста\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Через 20 минут на в окошке теста появятся полоски. Если одна полоска - то антител на ВИЧ нет. "
                      "Если Вы увидите 2 полоски, то результат на ВИЧ положительный, то есть определены антитела к ВИЧ. "
                      "При положительном результате, необходимо сдать тест на ВИЧ повторно в Центре СПИД или другой "
                      "медицинской организации.\n\n",
                  style: contentNormal),
              TextSpan(
                  text: "Точность теста очень высока - 99%\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Однако, если у вас было небезопасное поведение относительно недавно, то лучше сдать тест спустя "
                      "2-3 недели, тогда результат будет более верным. Это связано с периодом окна – то есть периода, когда "
                      "заражение ВИЧ уже произошло, но антитела не образовались.\n\n",
                  style: contentNormal),
              TextSpan(
                  text: "Как часто следует проходить тестирование на ВИЧ? \n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Если Вы сексуально активны и у Вас были случаи опасного поведения (случайные половые контакты, множественные "
                      "партнеры, секс без использования презерватива, либо потребление наркотиков с использованием шприца) рекомендуется "
                      "проходить исследование на ВИЧ 1-2 раза в год.\n\n",
                  style: contentNormal),
              TextSpan(
                  text: "Напомним, экспресс-тесты вы можете получить бесплатно с понедельника по пятницу по адресу : \n\n",
                  style: contentNormal),
              TextSpan(
                  text: "г. Бишкек, улица Логвиненко 8, кабинет - 7-8-9 Телефон для справок: 0774 42-08-66\n\n",
                  style: contentItalic),
              TextSpan(
                  text: "#РЦСПИДКР #АИВкеТест #ӨзСтатусуңдуБил2020",
                  style: TextStyle(color: kModerateBlue, fontSize: 18, fontWeight: FontWeight.w600)),
            ]),
          ),
        ),
        Image.asset("assets/images/persons_picture.png")
      ]);
    }

    Widget _hivSelfTesting() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _hivSelfTestingContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("hiv_self_test".tr(),
            style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
            child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
            onTap: () {
              Navigator.pop(context);
            }),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                showSlider = !showSlider;
              });
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text("Aa",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          )
        ],
      ),
      body: _hivSelfTesting(),
    );
  }
}
