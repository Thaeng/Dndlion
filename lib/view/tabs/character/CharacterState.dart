
import 'package:dndlion/model/Character.dart';
import 'package:dndlion/model/Stat.dart';
import 'package:dndlion/view/tabs/character/CharacterWidget.dart';
import 'package:flutter/material.dart';

class CharacterState extends State<CharacterWidget> {

  Character _character;

  CharacterState(Character character){
    this._character = character;
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  Scaffold _buildScaffold(){
      return Scaffold(
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigationsBar(),
      );
  }

  BottomNavigationBar _buildBottomNavigationsBar(){
    return BottomNavigationBar(
      currentIndex: 0,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Theme.of(context).textTheme.body1.color,
      unselectedItemColor: Theme.of(context).textTheme.body1.color,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryIconTheme.color),
          title: Text("Take Damage"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_forward, color: Theme.of(context).primaryIconTheme.color),
          title: Text("Heal"),
        )
      ],
      onTap: (int index) {
        if(index == 0){
          _asyncApplyDamageDialog(1,"Take Damage", context);
        }else{
          _asyncApplyDamageDialog(-1,"Heal", context);
        }
      },
    );
  }

  void _asyncApplyDamageDialog(int multiplier, String text, BuildContext context) async{
    String dmg = '0';
    dmg = await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(text),
          content: TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              onChanged: (value){
                dmg = value;
              },
              decoration: new InputDecoration(
                labelText: 'Value',
                hintText: 'e.g. 10',
              ),
            ),

          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: (){
                setState(() {
                  Navigator.of(context).pop(dmg);
                });
              },
            )
          ],
        );
      }
    );
    _character.takeDamage(int.parse(null == dmg ? "0" : dmg) * multiplier);
  }

  Widget _buildBody(){
    List<Widget> widgets = _buildCharacterView();
    ListView listView = ListView.builder(
        itemCount: widgets.length * 2,
        itemBuilder: (context, i) {
          if(i.isOdd) return Divider(thickness: 2.0, color: Theme.of(context).textTheme.body1.color,);
          return widgets[i ~/ 2];
    });
    return listView;
  }

  List<Widget> _buildCharacterView(){
    List<Widget> widgets = List();

    widgets.add(_buildCharacterName());
    widgets.add(_character.image);
    widgets.add(_buildHealth());
    widgets.add(_buildProficiencyAndArmorClass());
    _character.stats.forEach((stat) => widgets.add(_buildPrimaryStat(stat)));

    return widgets;
  }

  Widget _buildHealth(){
    return Column(
      children: <Widget>[
        Container(
            constraints: const BoxConstraints.tightFor(
              height: 40,
            ),
            child: LinearProgressIndicator(
              value: mapIntRangeToDoubleRange(_character.health.current, 0, _character.health.max, 0.0, 1.0),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              backgroundColor: Theme.of(context).primaryColor,
            )
        ),
        Container(
          height: 40,
          child: ListTile(
            title: Center(child : Text("  " + _character.health.current.toString() + " / " + _character.health.max.toString())),
            trailing: Text(_character.health.temporary.toString()),
          ),
        )
      ],
    );
  }

  Widget _buildCharacterName(){
    return ListTile(
      title: Center(
        child: Text(_character.name.toString(), style: TextStyle(fontSize: 40.0),),
      ),
    );
  }

  Widget _buildProficiencyAndArmorClass(){
    return ListTile(
      leading: Text('Proficiency:' + _character.proficiencyBonus.toString()),
      trailing: Text('AC:' + _character.armorClass.toString()),
    );
  }

  Widget _buildPrimaryStat(Stat stat){
    ExpansionTile listTile = ExpansionTile(
      title: _createTitleFromStat(stat),
      children: _buildSkills(stat),
      leading: Icon(Icons.slideshow, color: Theme.of(context).primaryIconTheme.color),
      trailing: Container(
        width: 96,
          child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add, color: Theme.of(context).primaryIconTheme.color),
              onPressed: () {
                setState(() {
                  _character.increaseStatByOne(stat.name);
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.remove, color: Theme.of(context).primaryIconTheme.color),
              onPressed: () {
                setState(() {
                  _character.decreaseStatByOne(stat.name);
                });
              },
            ),
          ],
        )
      )
    );
    return listTile;
  }


  Text _createTitleFromStat(Stat stat){
    return Text(stat.name + " : " + stat.value.toString());
  }

  List<Widget> _buildSkills(Stat stat){
    List<Widget> widgets = List();

    stat.skills.forEach((skill) => widgets.add(
      Container(
        color: Theme.of(context).primaryColor.withGreen(50).withBlue(50).withRed(50),
        child: ListTile(
          title: Text(skill.name + ":" + skill.value.toString()),
          leading: Checkbox(
            value: skill.proficient,
            onChanged: (bool value) {
              setState(() {
                skill.proficient = value;
                _character.updateSkills();
              });
            },
          ),
        ),
      )
    ));
    return widgets;
  }

  double mapIntRangeToDoubleRange(int val, int minInt, int maxInt, double minDouble, double maxDouble){
    return minDouble + ((maxDouble - minDouble) / (maxInt - minInt)) * (val - minInt);
  }

}