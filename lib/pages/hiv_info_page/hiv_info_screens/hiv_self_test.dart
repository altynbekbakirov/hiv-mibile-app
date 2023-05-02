import 'dart:ui';
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
    TextStyle chapterStyle = TextStyle(color: Colors.black, fontSize: fontSize + 10, fontWeight: FontWeight.w700);

    TextStyle contentItalic = TextStyle(color: Colors.black, fontSize: fontSize, fontStyle: FontStyle.italic);

    TextStyle contentNormal = TextStyle(color: Colors.black, fontSize: fontSize);

    TextStyle normalBold = TextStyle(color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w700);

    TextStyle normalBoldForChapter = TextStyle(color: Colors.black, fontSize: fontSize + 6, fontWeight: FontWeight.w600);

    Widget _hivSelfTestingContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "hiv_selftest1".tr(), style: chapterStyle),
              WidgetSpan(
                child: SizedBox(height: 40),
              ),
              TextSpan(text: "hiv_selftest2".tr(), style: TextStyle(color: Colors.black, fontSize: fontSize + 6, fontWeight: FontWeight.bold)),
              WidgetSpan(
                child: SizedBox(height: 30),
              ),
              TextSpan(text: "hiv_selftest3".tr(), style: normalBold),
              TextSpan(
                text: "hiv_selftest4".tr(),
                style: contentNormal,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "hiv_selftest5".tr(), style: normalBoldForChapter),
              WidgetSpan(
                child: SizedBox(height: 30),
              ),
              TextSpan(text: "hiv_selftest6".tr(), style: contentNormal),
              TextSpan(text: "hiv_selftest7".tr(), style: normalBold),
              WidgetSpan(
                child: SizedBox(height: 40),
              ),
              TextSpan(text: "hiv_selftest8".tr(), style: normalBoldForChapter),
              TextSpan(text: "hiv_selftest9".tr(), style: contentNormal),
              WidgetSpan(
                child: SizedBox(height: 40),
              ),
              TextSpan(text: "hiv_selftest10".tr(), style: normalBoldForChapter),
              TextSpan(text: "hiv_selftest11".tr(), style: contentNormal),
              WidgetSpan(
                child: SizedBox(height: 40),
              ),
              TextSpan(text: "hiv_selftest12".tr(), style: normalBoldForChapter),
              TextSpan(text: "hiv_selftest13".tr(), style: contentNormal),
              WidgetSpan(
                child: SizedBox(height: 40),
              ),
              TextSpan(text: "hiv_selftest14".tr(), style: normalBoldForChapter),
              TextSpan(text: "hiv_selftest15".tr(), style: contentNormal),
              WidgetSpan(
                child: SizedBox(height: 40),
              ),
              TextSpan(text: "hiv_selftest16".tr(), style: normalBoldForChapter),
              TextSpan(text: "hiv_selftest17".tr(), style: contentNormal),
            ]),
          ),
        ),
        Image.asset("assets/images/gradusnik.png"),
        SizedBox(height: 20),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "hiv_selftest18".tr(), style: normalBoldForChapter),
              TextSpan(text: "hiv_selftest19".tr(), style: contentNormal),
              WidgetSpan(
                child: SizedBox(height: 40),
              ),
              TextSpan(text: "hiv_selftest20".tr(), style: normalBoldForChapter),
              TextSpan(text: "hiv_selftest21".tr(), style: contentNormal),
              WidgetSpan(
                child: SizedBox(height: 40),
              ),
              TextSpan(text: "hiv_selftest22".tr(), style: normalBoldForChapter),
              TextSpan(text: "hiv_selftest23".tr(), style: contentNormal),
              TextSpan(text: "hiv_selftest24".tr(), style: contentNormal),
              TextSpan(text: "hiv_selftest25".tr(), style: contentItalic),
            ]),
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("hiv_selftest26".tr(), style: normalBoldForChapter),
            const SizedBox(
              height: 12,
            ),
            InkWell(
                child: Text('https://hivtest.kg/', style: TextStyle(color: Colors.blueAccent, fontSize: fontSize)), onTap: () => launch('https://hivtest.kg/')),
            const SizedBox(
              height: 4,
            ),
            InkWell(
                child: Text('https://www.epictest.live/', style: TextStyle(color: Colors.blueAccent, fontSize: fontSize)),
                onTap: () => launch('https://www.epictest.live/')),
          ]),
        ),
        SizedBox(height: 20),
        ListTile(
          title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("hiv_selftest27".tr(), style: normalBoldForChapter),
            const SizedBox(
              height: 12,
            ),
            Table(
              border: TableBorder.all(color: Colors.black54),
              columnWidths: {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(4),
                2: FlexColumnWidth(5),
                3: FlexColumnWidth(2),
                4: FlexColumnWidth(4),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Наименование",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Ф.И.О руководителей",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Адрес центра",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Center(
                          child: Text(
                        "Код",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "№ телефона",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "БГЦКГВГ и ВИЧ г. БИШКЕК",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Карагулова Аида Шайлобековна",
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "г. Бишкек 720021",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "0554 34-63-32",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "0778 34-63-32 (WhatsApp)",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "ул. Токтогула 62а",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "spid@dz.gov.kg",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                          Text(
                            "karagulova.ash@mail.ru",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "0312",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "48-66-17 (факс)",
                            style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "43-40-76 гл.врач",
                            style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "48-66-19 эпид.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "48-66-17 дисп.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "68-08-30 бух",
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("ООЦКГВГиВИЧ",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Нарматова Эльмира Балтабаевна",
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "г. Ош 7235500",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "0550-84-03-01",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "Пер. Моминова 10",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "elmira.narmatova@yandex.ru",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                          Text(
                            "aidsosh1@gmail.com",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "03222",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "7-16-02 пр.(факс)",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "7-11-26 гл.врач",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "7-15-98 лаб",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "7-16-24 дисп.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "7-15-95 эпид.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "7-16-11 бух",
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("ЖОЦКГВГиВИЧ",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Сатарова Элмира Аскербаевна",
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "г. Жалалабат 720900",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "0773-45-40-74",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "ул. Курортная 37",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "aidja@yandex.com",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                          Text(
                            "elmira.satarova@yandex.ru",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "03722",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "2-07-24 пр.(факс)",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "6-03-42 гл.врач",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "2-15-99 лаб",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "2-31-59 дисп.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "2-07-24 эпид.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "2-07-24 бух",
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("ТОЦКГВГиВИЧ",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Алишерова Гульмира Шайлобековна",
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "г. Талас 722720",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "0557-60-11-60",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "ул. Ленина 257",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "talasspid@mail.ru",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "03422",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "5-52-36 пр.(факс) гл.врач",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "29-60-91 дисп.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "5-43-41 эпид.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "5-48-39 бух",
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("БОЦКГВГиВИЧ",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Балтабаев Абазбек Мамасабырович",
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "г. Баткен 720100",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "0778 02 006 19",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "ул. Раззакова 13",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "batken@inbox.ru",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                          Text(
                            "btkens@mail.ru",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "03622",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "5-08-77 пр.(факс) гл.врач",
                            style: TextStyle(fontSize: 9, ),
                          ),
                          Text(
                            "5-14-07 лаб",
                            style: TextStyle(fontSize: 9, ),
                          ),
                          Text(
                            "5-04-89 дисип.эпид.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "6-04-40 бух",
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("ИОЦКГВГиВИЧ",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Огоева Шаршекан Бакыевна",
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "г. Каракол 722360",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "0702 10-70-15",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "ул. Пролетарская 118",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "Ikspid@mail.ru",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                          Text(
                            "sharshekan@mail.ru",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "03922",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "5-17-18 пр.(факс).бух",
                            style: TextStyle(fontSize: 9, ),
                          ),
                          Text(
                            "5-97-559 гл.врач",
                            style: TextStyle(fontSize: 9, ),
                          ),
                          Text(
                            "5-08-58 дисип.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "5-16-64 эпид.от",
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("НОЦКГВГиВИЧ",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Бектурсунова Айнагул Макиловна",
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "г. Нарын 722600",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "0702-10-06-60",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "ул. Раззакова 1",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "naryn-spid@mail.ru",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                          Text(
                            "bektursunova63@mail.ru",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "03522",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "5-19-42 (факс).гл.врач",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "5-30-54 дисип.эпид.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "5-30-54 лаб.бух",
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("ЧОЦКГВГи ВИЧ",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Шарекеев Темирбек Байышович ",
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "г. Токмок 722300",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "0556-25-06-67",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "0703-40-25-23",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "0559-54-05-59 Зам",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "ул. Комсомольская 129",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "babaeva_nur@mail.ru",
                            style: TextStyle(fontSize: 9, color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "03138",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "3-06-12 пр.(факс) гл.врач",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "3-06-14 лаб",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "7-40-18 дисип.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "3-06-17 эпид.от",
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            "3-06-12 бух",
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ]),
        ),
      ]);
    }

    Widget _hivSelfTesting() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0), child: _hivSelfTestingContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("hiv_self_test".tr(), style: TextStyle(color: Colors.black, fontSize: 18)),
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
                child: Text("Aa", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
              ),
            ),
          )
        ],
      ),
      body: _hivSelfTesting(),
    );
  }
}
