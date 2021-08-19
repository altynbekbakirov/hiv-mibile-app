
import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(TextWidget());

class TextWidget extends StatefulWidget {
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {

  bool _isLoading = true;
  int _textBodyNumber = 1;
  double _fontSize = 18;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
          children: [
            ListTile(
                title: Text(
              'Что такое ВИЧ?',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Что такое ВИЧ?', type: 1,));
                  Navigator.push(context,route);
                }),
            Divider(),
            ListTile(
                title: Text(
                  'Иммунная система',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Иммунная система', type: 2,));
                  Navigator.push(context,route);}
            ),
            Divider(),
            ListTile(
                title: Text(
                  'Что происходит, когда ВИЧ попадает в организм человека?',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Что происходит, когда ВИЧ попадает в организм человека?', type: 3,));
                  Navigator.push(context,route);}
            ),
            Divider(),
            ListTile(
                title: Text(
                  'Как вирус попадает в организм человека?',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Как вирус попадает в организм человека?', type: 4,));
                  Navigator.push(context,route);}
            ),
            Divider(),
            ListTile(
                title: Text(
                  'Как предотвратить заражение ВИЧ?',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Как предотвратить заражение ВИЧ?', type: 5,));
                  Navigator.push(context,route);}
            ),
            Divider(),
            ListTile(
                title: Text(
                  'Доконтактная и постконтактая профилактика ВИЧ-инфекции',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Доконтактная и постконтактая профилактика ВИЧ-инфекции', type: 6,));
                  Navigator.push(context,route);}
            ),
            Divider(),
            ListTile(
                title: Text(
                  'Поддерживающая терапия метадоном (ПТМ)',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Поддерживающая терапия метадоном (ПТМ)', type: 7,));
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
                    TextSpan(text: 'ЧТО ТАКОЕ ВИРУС?'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Вирусы', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' – это мельчайшие возбудители некоторых инфекционных заболеваний. Вирусы настолько малы, что их можно разглядеть только через '
                        'электронный микроскоп при очень большом увеличении. Попадая в человеческий организм, вирусы вызывают такие инфекционные болезни, как '
                        'ВИЧ-инфекция, грипп, полиомиелит, бешенство, гепатит и другие.Вирусы передаются человеку различными путями. Например, вирус ветряной '
                        'оспы передается через воздух, а вирус гепатита А передается через пищу или воду.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'ЧТО ТАКОЕ ВИЧ?'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'ВИЧ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '– это вирус иммунодефицита человека: \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Вирус', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' – это мельчайший возбудитель инфекционных заболеваний;'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Иммунодефицит ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '– означает, что вирус разрушает иммунную систему и создает условия «дефицита» (слабости, недостатка) в борьбе организма против инфекционных заболеваний;'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Человека ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '– означает то, что данный вирус поражает только человека.ВИЧ относится к семейству '),
                    TextSpan(text: '«ретровирусов» ', style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(text: ', поэтому противовирусные лекарства, назначаемые для лечения ВИЧ-инфекции, называются '),
                    TextSpan(text: 'антиретровирусными препаратами, ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' а лечение называется '),
                    TextSpan(text: 'антиретровирусная терапия (АРТ). ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'ВИЧ вызывает у людей заболевание, которое называют '),
                    TextSpan(text: 'ВИЧ-инфекция.', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    TextSpan(text: 'ЧТО ТАКОЕ ИММУННАЯ СИСТЕМА?'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Иммунная система организма', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' отвечает за защиту организма от всего чужого – как от чужеродных агентов (микробов, вирусов), '
                        'так и от собственных измененных клеток организма. Это позволяет сохранить целостность организма. Поэтому ее еще называют '),
                    TextSpan(text: 'защитной системой.\n', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Основные клетки иммунной защиты находятся в крови и костном мозге, в других органах, например, в печени. '
                        'Различают несколько видов иммунных клеток, одними из них являются Т-лимфоциты помощники (хелперы), которые организуют '
                        'слаженную работу иммунной системы. Их называют СД4 клетками. \nЧеловека окружает множество микроорганизмов (вирусы, бактерии, '
                        'грибки), которые при попадании в организм могут стать причиной инфекционных заболеваний (грипп, менингит, туберкулез, дизентерия '
                        'и т. п.). Иммунная система в большинстве случаев уничтожает микроорганизмы, попадающие в человеческий организм, защищая его от болезней.'
                        ' Однако, ВИЧ – вирус иммунодефицита человека – разрушает основные клетки иммунитета (СД4 клетки). В результате организм становится беззащитным перед другими болезнями.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/image2.png', fit: BoxFit.fitWidth,),
                ),
              ],
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                    child: Image.asset('assets/images/image1.png', fit: BoxFit.fitWidth,)),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'ЧТО ПРОИСХОДИТ, КОГДА ВИЧ ПОПАДАЕТ В ОРГАНИЗМ ЧЕЛОВЕКА?'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Когда ВИЧ попадает в организм человека, он атакует клетки иммунной системы, а именно, '),
                    TextSpan(text: 'Т-лимфоциты помощники (CД4 клетки). ', style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(text: 'В результате пораженная клетка начинает сама производить вирусы. Таким образом, она теряет свои защитные функции и со временем погибает. '
                        'До 10 миллиардов новых вирусных частиц вырабатываются в день и миллионы CД4 клеток разрушаются ежедневно. Новые вирусы выходят из клетки и поражают новые '
                        'Т-лимфоциты. Уменьшение числа CД4 клеток приводит к снижению иммунитета, который уже не может защищать организм от возбудителей инфекционных и других заболеваний, '
                        'которые редко наблюдаются у лиц с сильной иммунной системой. Их называют СПИД-индикаторными заболеваниями или '),
                    TextSpan(text: 'оппортунистическими инфекциями.', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            tileColor: Colors.lightBlue,
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Состояние иммунной системы инфицированного ВИЧ человека определяется подсчетом CД4 клеток. Их количество '
                        'в крови составляет в норме от 500 до 1500 клеток в 1 микролитре. Когда у человека, живущего с ВИЧ, выявляется одна '
                        'или несколько оппортунистических инфекций и уровень СД4 клеток снижается ниже 200 в 1 микролитре крови, то говорят о наступлении стадии СПИДа.',
                        style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
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
                    TextSpan(text: 'ЧТО ПРОИСХОДИТ, КОГДА ВИЧ ПОПАДАЕТ В ОРГАНИЗМ ЧЕЛОВЕКА?'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'ВИЧ-инфекция ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '– это хроническое медленно прогрессирующее инфекционное заболевание, вызываемое вирусом иммунодефицита человека (ВИЧ), '
                        'протекающее с поражением иммунной системы. При отсутствии лечения ВИЧ-инфекция приводит к появлению инфекционных заболеваний, '
                        'опухолей и к развитию синдрома приобретённого иммунного дефицита (СПИД). \n'),
                    TextSpan(text: '\n', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Когда ВИЧ попадает в организм человека, он атакует клетки иммунной системы, а именно, Т-лимфоциты помощники (CД4 клетки).'
                        ' В результате пораженная клетка начинает сама производить вирусы. В результате клетка не может защищать организм и погибает. До 10 '
                        'миллиардов новых вирусных частиц вырабатываются в день и миллионы CД4 клеток разрушаются ежедневно. Новые вирусы выходят из клетки '
                        'и поражают другие СД-4 клетки. Уменьшение числа CД4 клеток приводит к снижению иммунитета, который уже не может защищать организм от '
                        'возбудителей инфекционных и других заболеваний, которые редко наблюдаются у лиц с сильной иммунной системой. Их называют'
                        ' СПИД-индикаторными заболеваниями или '),
                    TextSpan(text: 'оппортунистическими инфекциями.', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/mechanism.png', fit: BoxFit.fitWidth,),
                ),
              ],
            ),
          ),
          ListTile(
            tileColor: Colors.lightBlue,
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Состояние иммунной системы инфицированного ВИЧ человека определяется подсчетом CД4 клеток. Их количество '
                        'в крови составляет в норме от 500 до 1500 клеток в 1 микролитре. Когда у человека, живущего с ВИЧ, выявляется одна '
                        'или несколько оппортунистических инфекций и уровень СД4 клеток снижается ниже 200 в 1 микролитре крови, то говорят о наступлении стадии СПИДа.',
                        style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                    child: Image.asset('assets/images/disease_evolution.png', fit: BoxFit.fitWidth,)),
              ],
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                    child: Image.asset('assets/images/disease_evolution1.png', fit: BoxFit.fitWidth,)),
              ],
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                    child: Image.asset('assets/images/disease_evolution2.png', fit: BoxFit.fitWidth,)),
              ],
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
                    TextSpan(text: 'Как вирус попадает в организм человека?'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'ВИЧ - ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'это вирус иммунодефицита человека. Это означает, что им болеет только человек и вирус передается от человека к человеку. \n'),
                    TextSpan(text: '\n', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Существует только 3 пути передачи ВИЧ:'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/image_way1.png', fit: BoxFit.fitWidth,),
                ),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Половым путем ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' при всех видах сексуальных контактов: оральных, вагинальных анальных. Особенно опасны анальные половые контакты.'
                        ' Частая смена половых партнеров, случайные половые контакты; насильственный секс, а также групповой секс повышают риск инфицирования'
                        ' ВИЧ. Увеличивает риск инфицирования ВИЧ наличие инфекций, передающихся половым путем (ИППП). '),
                    TextSpan(text: 'Снижает риск инфицирования ВИЧ:', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' Воздержание от половых контактов; верность одному неинфицированному партнеру; '
                        'использование презервативов и специальных смазок на водной основе (лубрикантов).'),

                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/image_way2.png', fit: BoxFit.fitWidth,),
                ),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Инъекционным путем: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'при совместном употреблении наркотиков путем инъекций; при получении медицинских услуг у случайных лиц '
                        '(переливание крови; хирургические операции; инъекции; лечение у талибов, сопровождающееся повреждением кожи – насечки; '
                        'кровопускание; обрезание); при проведении татуировок, пирсинга, иглоукалывания нестерильным инструментарием. \n\n'),
                    TextSpan(text: 'Снижает риск ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' отказ от употребления наркотиков, использование индивидуального шприца и посуды для приготовления наркотиков; '
                        'получение медицинских услуг только в медицинских учреждениях; контроль использования стерильного инструментария при проведении'
                        ' татуировок, пирсинга и других процедур вне организаций здравоохранения. '),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                    child: Image.asset('assets/images/image_way3.png', fit: BoxFit.fitWidth,)),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'От ВИЧ-позитивной матери – ребенку ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Своевременное выявление ВИЧ-инфекции и прием профилактического лечения антиретровирусными препаратами снижает риск передачи ВИЧ ребенку. \n\n'),
                    TextSpan(text: 'Предлагаем Вам получить консультацию по оценке и снижению риска у консультантов НПО или в медицинском центре. \n\n'),
                    TextSpan(text: 'Вы можете сами определить риски инфицирования. Для этого ответьте на следующие несколько вопросов. Если хотя бы по одному '
                        'вопросу Вы ответили «да», то Вам нужно пройти консультирование и тестирование на ВИЧ, а также предпринять меры по собственной безопасности:\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Знаете ли Вы о путях передачи ВИЧ?'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Были ли у Вас сексуальные отношения?'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Всегда ли Вы использовали презерватив при сексуальных контактах?'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Было ли у Вас более одного полового партнера?'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Были ли у Вас или Вашего полового партнера язвы на половых органах, необычные выделения из половых органов, боли внизу живота,'
                        ' либо проходили ли Вы лечение инфекций, которые передаются половым путем (сифилис, гонорея, трихомониаз)?'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Были ли у Вашего партнера симптомы ИППП?'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Принимали ли вы когда-либо наркотики путем инъекций, хотя бы раз?'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Принимали ли Вы наркотики совместно с Вашим партнером /партнерами?'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Болели ли Вы гепатитом?'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'ВИЧ-не передается', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                    child: Image.asset('assets/images/image_way4.png', fit: BoxFit.fitWidth,)),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'При объятии, рукопожатии, поцелуе \nПри кашле и чихании'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                    child: Image.asset('assets/images/image_way5.png', fit: BoxFit.fitWidth,)),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'При приготовлении и принятии пищи; при пользовании общей посудой, столовыми приборами, '
                        'полотенцами и постельным бельем. При общении пользовании книгами,  бытовыми приборами.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                    child: Image.asset('assets/images/image_way6.png', fit: BoxFit.fitWidth,)),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'При пользовании туалетом, душем, ванной; при плавании в бассейне, при занятиях спортом'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                    child: Image.asset('assets/images/image_way7.png', fit: BoxFit.fitWidth,)),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'При укусах насекомых (комаров, москитов, пчел). При общении и укусах животных '),
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
                    TextSpan(text: 'Как предотвратить заражение ВИЧ?'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Предупредить заражение ВИЧ легче, чем лечить. Соблюдение мер профилактики защитит Вас от заражения вирусными гепатитами или '
                        'инфекциями, которые передаются половым путем (ИППП). Инфицирование ИППП увеличивает риск заражения ВИЧ половым путем.Поскольку ВИЧ '
                        'передается только тремя путями – можно защитить себя от заражения используя следующие правила.\n\n'),
                    TextSpan(text: 'Поскольку ВИЧ передается только тремя путями – можно защитить себя от заражения используя следующие правила.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Профилактика полового пути передачи ВИЧ строится на стратегии четыре В:\n', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В', style: TextStyle( fontWeight: FontWeight.bold)),
                    TextSpan(text: 'оздержание: Отказ от сексуальных контактов.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В', style: TextStyle( fontWeight: FontWeight.bold)),
                    TextSpan(text: 'ерность одному неинфицированному ВИЧ половому партнеру. Это означает отказ от случайных половых контактов, химсекса, и иных '
                        'форм опасного сексуального поведения. Насильственный секс усиливает риск инфицирования ВИЧ.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                    child: Image.asset('assets/images/condom.png', fit: BoxFit.fitWidth,)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В', style: TextStyle( fontWeight: FontWeight.bold)),
                    TextSpan(text: 'сегда использовать презерватив и смазки на водной основе (лубриканты) при половых контактах.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В', style: TextStyle( fontWeight: FontWeight.bold)),
                    TextSpan(text: 'ыявление и лечение ИППП совместно с половым партнером.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Профилактика инъекционного пути передачи ВИЧ:\n', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Отказ от употребления наркотиков.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                    child: Image.asset('assets/images/hiv_drug.png', fit: BoxFit.fitWidth,)),
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Image.asset('assets/images/hiv_drug1.png', fit: BoxFit.fitWidth,)),
              ],
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Если Вы употребляете наркотики, то снижайте риск: пользуйтесь только своим чистым шприцем; не набирайте наркотик из общей '
                        'посуды; откажитесь от инъекционного потребления – переходите на неинъекционные пути потребления (курение, прием через рот) или примите '
                        'участие в метадоновой программе. (О метадоновой программе можно узнать здесь).'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Не проводите медицинские манипуляции у случайных людей вне медицинского учреждения.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'При проведении процедур, связанных с повреждением кожи (иглоукалывание; татуировки, пирсинг), следите, чтобы использовалось стерильное оборудование.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Профилактика  передачи ВИЧ от ВИЧ-позитивной матери ребенку\n', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Пройдите вместе с половым партнером тест на ВИЧ при планировании или на ранней стадии беременности.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Строго соблюдайте назначения по лечению ВИЧ-инфекции (АРТ), которое предупредит передачу ВИЧ ребенку.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Проведите обследование на ВИЧ новорожденного ребенка и его лечение против ВИЧ сразу после родов.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Наблюдайтесь у врача и следуйте рекомендациям о родах и кормлении ребенка.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Даже, если человек живет с ВИЧ, ему нужно соблюдать меры профилактики', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '  для предупреждения передачи ВИЧ другим людям. Это защитит самого человека с ВИЧ от заражения вирусными гепатитами, ИППП, '
                        'а также от повторного заражения другим измененным вирусом иммунодефицита человека. '),
                    TextSpan(text: 'Повторное заражение, а также заражение другими инфекции ухудшит его состояние здоровья.\n', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Для предупреждения ВИЧ-инфекции можно также проводить профилактическое лечение до контакта – называется доконтактная'
                        ' профилактика (ДКП), а также после опасного контакта  –  постконтактая профилактика (ПКП).  ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
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
                    TextSpan(text: 'Доконтактная и постконтактая профилактика ВИЧ-инфекции'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Доконтактная профилактика (ДКП) ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '– это прием антиретровирусных препаратов для предотвращения инфицирования ВИЧ людям с отрицательным ВИЧ-статусом. Доконтактная профилактика '
                        'рекомендуется в случаях, если Вы имеете постоянного полового партнера, инфицированного ВИЧ, который не принимает либо часто нарушает прием препаратов.'
                        ' Доконтактная профилактика также рекомендуется людям, которые практикуют опасное \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Рекомендации по доконтактной профилактике:', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' Следует получить полную информацию о ДКП в Центре СПИД или в организации сообщества. Если Вы решили принимать ДКП, '
                        'Вы должны определиться с моделью приема. Если это ежедневный (постоянный) прием, его нужно осуществлять очень аккуратно, ежедневно'
                        ' в установленное время весь период, когда существует риск. При таком приеме эффект достигается в течение 4-7 дней. Если у Вас бывают '
                        'редкие опасные контакты, рекомендуется ситуативный прием ДКП, который прием ДКП в течение 3 дней до и после контакта. Такой прием '
                        'рекомендуется при редких ситуациях опасного поведения. \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Следует помнить: ДКП назначается врачом с учетом состояния здоровья, отрицательного ВИЧ-статуса.'
                        ' Назначение требует Вашей регистрации в центре СПИД и наблюдения. Лекарства для ДКП выдаются бесплатно в центрах СПИД.'
                        ' В Кыргызстане получить ДКП можно при поддержке НПО.  При получении ДКП человек регулярно наблюдается в центре СПИД'
                        ' (проходит осмотр и тестирование на ВИЧ каждые 3 месяца).', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/truvada.png', fit: BoxFit.fitWidth,),
                ),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Постконтактная профилактика (ПКП) – ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'медицинская мера, направленная на профилактический прием антиретровирусных препаратов для предотвращения заражения ВИЧ-инфекцией после '
                        'возможного контакта с вирусом (при половом контакте, совместном употреблении наркотиков или в других случаях.\n\n'),
                    TextSpan(text: 'После оценки риска, проведения тестирования на ВИЧ, назначается ПКП. Она может быть назначена в Центре СПИД, на станции'
                        ' скорой медицинской помощи или в других организациях здравоохранения. '),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Важно помнить: Начинать ПКП нужно как можно скорее после опасного контакта, и не позднее 72 часов (3 суток) после него. '
                        'Препараты назначает врач. Их принимают в течение месяца ежедневно строго по назначению врача. После этого человек находится под '
                        'наблюдением в течение 6 месяцев (проходит тест на ВИЧ через 1, 3 и 6 месяцев).', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Следует также помнить, что ДКП и ПКП не защищают от беременности и ИППП. Поэтому нужно параллельно использовать средства '
                        'защиты (презервативы, лубриканты) и контрацептивы.', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    TextSpan(text: 'Поддерживающая терапия метадоном (ПТМ)'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'У человека, который потребляет наркотики, и особенно опиоиды (героин, опий, морфин и другое) возникает ',),
                    TextSpan(text: 'психологическая зависимость', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' – то есть желание потреблять наркотики, чтобы получить удовольствие. Однако очень быстро возникает '),
                    TextSpan(text: 'физическая зависимость', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ', когда человек испытывает тяжелые страдания при отказе от наркотиков это называется '),
                    TextSpan(text: 'абстиненция ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'или ',),
                    TextSpan(text: 'ломка ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Поэтому человеку трудно отказаться от наркотиков даже из-за проблем со здоровьем, отсутствием денег или наркотика.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Есть несколько способов преодолеть ломку: сделать это самому, при помощи друзей или медицинских работников.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Однако наиболее безопасным и эффективным способом является участие в программе поддерживающей терапии метадоном. '
                        'Эта программа была внедрена в 2002 году и сейчас в Кыргызстане работает около 30 пунктов, где можно получить метадон. '
                        'Некоторые клиенты программы участвуют в ней с самого начала. Они живы, здоровы, имеют семьи и работают. '),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/metadone.png', fit: BoxFit.fitWidth,),
                ),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Метадон – ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' это синтетический наркотик из группы опиоидов, который употребляется через рот по назначению и под контролем врача. '
                        'Он используется для детоксикации (детокса) и лечения зависимости от опиодных наркотиков. Он имеет важное значение в предупреждении '
                        'инфицирования ВИЧ и другими инфекциями, передаваемыми через кровь (вирусные гепатиты). '),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Преимущества приема ПТМ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Участие в программе добровольно – только по Вашему желанию. '),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Метадон можно получить бесплатно в медицинских организациях, а также в тюрьмах (Перечень пунктов вы найдете здесь). \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Прием метадона позволят избавиться от вредного действия наркотика – то есть у человека восстанавливается здоровье.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Метадон принимают через рот (пьют), что помогает защитить себя от заражения вирусными гепатитами и ВИЧ.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Участие в программе важно для человека, живущего с ВИЧ. Оно помогает выработать приверженность к лечению – '
                        'то есть прием АРВП (лечения против ВИЧ-инфекции) в соответствии с рекомендациями врача.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Участие в ПТМ помогает восстановить семью и добрые отношения с родственниками.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Участие в программе ПТМ позволяет избежать проблем с милицией, так как приводит к отказу от приобретения, хранения и '
                        'потребления незаконных наркотиков.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Ограничения программы ПТМ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Лечение метадоном назначается только людям, которые потребляют опиоиды (героин, опий, морфин и др.). ПТМ не действует на '
                        'потребителей других наркотиков.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Для участия в программе нужно зарегистрироваться в организации здравоохранения. Факт регистрации носит конфиденциальный '
                        'характер и не разглашается третьим лицам. В настоящее время проводится работа, позволяющая вести анонимный учет клиентов (без '
                        'регистрации).'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Нужно ежедневно посещать пункт выдачи метадона. В настоящее время клиентам, которые аккуратно принимают терапию выдают метадон на 5 дней.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Метадон не излечивает зависимость от наркотиков, поэтому его принимают постоянно в течение многих лет.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Подробную информацию о программе ПТМ Вы можете получить в НПО, сотрудники которых помогут Вам начать эту терапию.'),
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
    else{
      return _myListView7(context);
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