import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemType{

  String type;
  IconData icon;
  static ItemType weapon = ItemType("Weapon", Icons.arrow_upward);
  static ItemType armor = ItemType("Armor", Icons.arrow_downward);

  ItemType(this.type, this.icon);


}