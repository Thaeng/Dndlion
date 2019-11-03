class StatNames {

  static StatNames strength = StatNames("Strength", "STR");
  static StatNames dexterity = StatNames("Dexterity", "DEX");
  static StatNames constitution = StatNames("Constitution", "CON");
  static StatNames intelligence = StatNames("Intelligence", "INT");
  static StatNames wisdom = StatNames("Wisdom", "WIS");
  static StatNames charisma = StatNames("Charisma", "CHR");

  String _name;
  String _acronyme;

  StatNames(this._name, this._acronyme);

  String get acronyme => _acronyme;

  String get name => _name;

  bool equals (StatNames statNames){
    return this.name == statNames.name;
  }

  @override
  String toString(){
    return this.name;
  }

}