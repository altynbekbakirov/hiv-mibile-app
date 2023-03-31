import 'package:hiv/components/custom_button.dart';
import 'package:hiv/model/arvp.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationOnArvpPage extends StatefulWidget {
  @override
  _InformationOnArvpPageState createState() => _InformationOnArvpPageState();
}

class _InformationOnArvpPageState extends State<InformationOnArvpPage> {

  double _fontSize = 18;


  void makeList(){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
              title: Text(
                'зидовудин/ламивудин+абакавир',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () {
                Route route =
                MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Зидовудин/ламивудин+абакавир', type: 1,));
                Navigator.push(context,route);
              }),
          Divider(),
          ListTile(
              title: Text(
                'зидовудин/ламивудин+невирапин',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () {

                Route route =
              MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Зидовудин/ламивудин+невирапин', type: 2,));
              Navigator.push(context,route);}
          ),
          Divider(),
          ListTile(
              title: Text(
                'тенофовир+эмтрицитабин/эфавиренз',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () { Route route =
              MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Тенофовир+эмтрицитабин/эфавиренз', type: 3,));
              Navigator.push(context,route);}
          ),
          Divider(),
          ListTile(
              title: Text(
                'ламивудин+тенофовир+долутегравир',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () { Route route =
              MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Ламивудин+Тенофовир+долутегравир', type: 4,));
              Navigator.push(context,route);}
          ),
          Divider(),
          ListTile(
              title: Text(
                'тенофовир+эмтрицитабин+долутегравир',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () { Route route =
              MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Тенофовир+эмтрицитабин+долутегравир', type: 5,));
              Navigator.push(context,route);}
          ),
          Divider(),
          ListTile(
              title: Text(
                'абакавир+ламивудин+лопинавир/ритонавир',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () { Route route =
              MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Абакавир+ламивудин+лопинавир/ритонавир', type: 6,));
              Navigator.push(context,route);}
          ),
          Divider(),
          ListTile(
              title: Text(
                'зидовудин/ламивудин+лопинавир/ритонавир',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () { Route route =
              MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Зидовудин/ламивудин+лопинавир/ритонавир', type: 7,));
              Navigator.push(context,route);}
          ),
          Divider(),
          ListTile(
              title: Text(
                'зидовудин/ламивудин+атазанавир/ритонавир',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () { Route route =
              MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Зидовудин/ламивудин+атазанавир/ритонавир', type: 8,));
              Navigator.push(context,route);}
          ),
          Divider(),
          ListTile(
              title: Text(
                'тенофовир/эмтрицитабин+лопинавир/ритонавир',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () { Route route =
              MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Тенофовир/эмтрицитабин+лопинавир/ритонавир', type: 9,));
              Navigator.push(context,route);}
          ),
          Divider(),
          ListTile(
              title: Text(
                'тенофовир/эмтрицитабин+ атазатазанавир/ритонавир',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () { Route route =
              MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Тенофовир/эмтрицитабин+ атазатазанавир/ритонавир', type: 10,));
              Navigator.push(context,route);}
          ),
          Divider(),
          ListTile(
              title: Text(
                'долутегравир/абакавир/ламивудин',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              onTap: () { Route route =
              MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Долутегравир/Абакавир/Ламивудин', type: 11,));
              Navigator.push(context,route);}
          ),
        ],
      ),
    );
  }
}

class TextBody extends StatefulWidget {
  double fontSize;
  String title;
  int type;

  TextBody({this.fontSize, this.title, this.type});

  @override
  _TextBodyState createState() => _TextBodyState();
}

class _TextBodyState extends State<TextBody> {
  Widget _myListView1(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Информация о препаратах'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.capsules, color: kColorPrimary, size: widget.fontSize + 10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'зидовудин/ламивудин+абакавир (тризивир (trizivir) // акимасол)', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' – комбинированный препарат, содержащий три препарата: зидовудин, ламивудин и абакавир.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сочетание с продуктами питания/рекомендации по применению'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.utensils, color: kColorPrimary, size: widget.fontSize + 10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'тризивир можно принимать как во время еды, так и между приемами пищи.'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView2(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Информация о препаратах'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.capsules, color: kColorPrimary, size: widget.fontSize +10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'зидовудин/ламивудин+невирапин (зидолам-н (zidolam-n))', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' — комбинированный препарат, в состав которого входят ламивудин, зидовудин и невирапин.  \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сочетание с продуктами питания/рекомендации по применению'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.utensils, color: kColorPrimary, size: widget.fontSize + 10),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'зидолам-н принимают независимо от приема пищи.'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView3(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Информация о препаратах'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.capsules, color: kColorPrimary, size: widget.fontSize +10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'тенофовир+эмтрицитабин/эфавиренз (трустива (trustiva) // атрипла (atripla) // трактен-н) ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '- комбинированный препарат с фиксированными дозами тенофовира,эмтрицитабина и эфавиренза.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сочетание с продуктами питания/рекомендации по применению'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.utensils, color: kColorPrimary, size: widget.fontSize + 10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Рекомендуется принимать препарат натощак, поскольку прием пищи может '
                        'увеличить время воздействия эфавиренза и привести к увеличению частоты нежелательных лекарственных '
                        'реакций. Для улучшения переносимости эфавиренза рекомендуется применять препарат перед сном.'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView4(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Информация о препаратах'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.capsules, color: kColorPrimary, size: widget.fontSize +10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'tld // виропил (viropil) ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' - это комбинированное лекарство для лечения ВИЧ-инфекции первого типа. Основой химического '
                        'состава препарата являются 3 активных компонента: долутегравир, ламивудин и тенофовир. \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сочетание с продуктами питания/рекомендации по применению'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.utensils, color: kColorPrimary, size: widget.fontSize + 10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Виропил принимают с большим количеством воды. Можно принимать независимо от приема пищи.'
                        'Для уменьшения риска проявления побочных эффектов этот препарат следует принимать перед сном.'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView5(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Информация о препаратах'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.capsules, color: kColorPrimary, size: widget.fontSize +10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'тенофовир+эмтрицитабин+долутегравир (spegra // telagara)', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' - комбинированный препарат, содержащий три антиретровирусных средства, таких как долутегравир, эмтрицибин, тенофовир алафенамид.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сочетание с продуктами питания/рекомендации по применению'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.utensils, color: kColorPrimary, size: widget.fontSize + 10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Таблетки spegra необходимо запивать  большим количеством воды. Во избежание проблем с ЖКТ, '
                        'пить лекарство рекомендуется через несколько часов после еды, в вечернее время (на ночь)'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView6(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Информация о препаратах'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.capsules, color: kColorPrimary, size: widget.fontSize +10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'абакавир+ламивудин (кивекса (kivexa) // лавудин-аб (lavudine-ab) // алагет (alaget) // албавир (albavir)) ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' - Комбинированное противовирусное средство для лечения ВИЧ-инфекции. \n'),
                    TextSpan(text: 'лопинавир/ритонавир (калетра (kaletra) // аливиа) ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '– комбинированный препарат обеспечивает противовирусную активность. \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сочетание с продуктами питания/рекомендации по применению'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.utensils, color: kColorPrimary, size: widget.fontSize + 10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Препараты кивекса можно принимать как во время еды, так и между приемами пищи.'
              'таблетки калетра следует проглатывать целиком, не разжевывая, не разламывая и не измельчая. Можно принимать независимо от приема пищи.'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView7(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Информация о препаратах'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.capsules, color: kColorPrimary, size: widget.fontSize +10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'зидовудин/ламивудин (комбивир // вирокомб (virocomb) // зидолам (zidolam) // зилакомб (zilacomb) // лазевун (lazevun) // лами-зидокс (lami-zidox) // эмлазид (emlazid)) ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '- Комбинированный противовирусный препарат, в состав которого входят ламивудин и зидовудин.  \n'),
                    TextSpan(text: 'лопинавир/ритонавир (калетра (kaletra) // аливиа) ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '- комбинированный препарат обеспечивает противовирусную активность. \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сочетание с продуктами питания/рекомендации по применению'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.utensils, color: kColorPrimary, size: widget.fontSize + 10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Комбивир - Для обеспечения точности дозирования таблетки необходимо проглатывать целиком. Для тех пациентов, '
              'у которых имеются трудности с проглатыванием, рекомендуется дробить таблетки и добавлять их к небольшому количеству полутвердой пищи '
              'или жидкости. Все количество полученной смеси необходимо принять внутрь незамедлительно. '
              'Таблетки калетра следует проглатывать целиком, не разжевывая, не разламывая и не измельчая. Можно принимать независимо от приема пищи.'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView8(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Информация о препаратах'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.capsules, color: kColorPrimary, size: widget.fontSize +10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'зидовудин/ламивудин (комбивир // вирокомб (virocomb) // зидолам (zidolam) // зилакомб (zilacomb) // лазевун (lazevun) // лами-зидокс (lami-zidox) // эмлазид (emlazid))', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '- Комбинированный противовирусный препарат, в состав которого входят ламивудин и зидовудин. \n'),
                    TextSpan(text: 'Атазанавир/ритонавир (атазор-р (atazor-r)) ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '- Противовирусные препараты для лечения ВИЧ-инфекции, комбинации.  \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сочетание с продуктами питания/рекомендации по применению'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.utensils, color: kColorPrimary, size: widget.fontSize + 10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Комбивир - Для обеспечения точности дозирования таблетки необходимо проглатывать целиком. Для тех пациентов, у которых имеются трудности с проглатыванием, '
                        'рекомендуется дробить таблетки и добавлять их к небольшому количеству полутвердой пищи или жидкости. Все количество полученной смеси необходимо принять внутрь незамедлительно.'
                        'Атазанавир/ритонавир принимают перорально во время еды'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView9(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Информация о препаратах'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.capsules, color: kColorPrimary, size: widget.fontSize +10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Тенофовир/эмтрицитабин (эмтритен // трувада // дабловир // доквир)', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' - Комбинированный противовирусный препарат с фиксированными дозами тенофовира дизопроксила фумарата и эмтрицитабина.\n'),
                    TextSpan(text: 'Лопинавир/ритонавир (калетра (kaletra) // аливиа) ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' - комбинированный препарат обеспечивает противовирусную активность. \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сочетание с продуктами питания/рекомендации по применению'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.utensils, color: kColorPrimary, size: widget.fontSize + 10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Эмтритен принимают внутрь, во время приема пищи или натощак.Таблетки Калетра следует проглатывать целиком, не разжевывая, не разламывая и не измельчая.'
                        ' Можно принимать независимо от приема пищи.'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView10(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Информация о препаратах'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.capsules, color: kColorPrimary, size: widget.fontSize +10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Тенофовир/эмтрицитабин (эмтритен // трувада // дабловир // доквир)', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' - Комбинированный противовирусный препарат с фиксированными дозами тенофовира дизопроксила фумарата и эмтрицитабина. \n'),
                    TextSpan(text: 'Атазанавир/ритонавир (атазор-р (atazor-r)) ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '- Противовирусные препараты для лечения ВИЧ-инфекции, комбинации. \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сочетание с продуктами питания/рекомендации по применению'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.utensils, color: kColorPrimary, size: widget.fontSize + 10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Эмтритен принимают внутрь, во время приема пищи или натощак.Атазанавир/ритонавир принимают перорально во время еды'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView11(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Информация о препаратах'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.capsules, color: kColorPrimary, size: widget.fontSize +10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Долутегравир/абакавир/ламивудин (триумек (triumeq))', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '- комбинированный противоврисуный  препарат, с фиксированными дозами долутегравира, абакавира и ламувидина. \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сочетание с продуктами питания/рекомендации по применению'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.utensils, color: kColorPrimary, size: widget.fontSize + 10,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Триумек принимают внутрь, запивая достаточным количеством воды. '),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }


  Widget _getCorrectTextBody(BuildContext context, int type){

    if(type == 1){
      return _myListView1(context);
    }
    else if(type ==2){
      return _myListView2(context);
    }
    else if(type ==3){
      return _myListView3(context);
    }
    else if(type ==4){
      return _myListView4(context);
    }
    else if(type ==5){
      return _myListView5(context);
    }
    else if(type ==6){
      return _myListView6(context);
    }
    else if(type ==7){
      return _myListView7(context);
    }
    else if(type ==8){
      return _myListView8(context);
    }
    else if(type ==9){
      return _myListView9(context);
    }
    else if(type ==10){
      return _myListView10(context);
    }
    else if(type ==11){
      return _myListView11(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Column(
            children: [
              Text(widget.title),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,5,0,10),
                child: Slider(
                  value: widget.fontSize,
                  min: 10,
                  max: 50,
                  divisions: 15,
                  label: widget.fontSize.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      widget.fontSize = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        body: _getCorrectTextBody(context, widget.type),
      ),
    );
  }
}