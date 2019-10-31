
import 'package:dndlion/model/Skill.dart';

class Stat {

  String name;
  int value;
  List<Skill> skills;

  Stat(String name, int value, List<Skill> skills){
    this.name = name;
    this.value = value;
    this.skills = skills;
  }

  void updateSkills(int proficiencyBonus){
    for(Skill skill in skills){
      skill.value = skill.proficient ? getModifier() + proficiencyBonus : getModifier();
    }
  }

  int getModifier(){
    return (value ~/2) - 5;
  }

  void increaseByOne(){
    this.increase(1);
  }

  void decreaseByOne(){
    this.increase(-1);
  }

  void increase(int amount){
    this.value += amount;
  }

}