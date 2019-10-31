
import 'package:dndlion/model/Character.dart';
import 'package:dndlion/view/tabs/character/CharacterState.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatefulWidget {

  final Character _character = Character();

  @override
  CharacterState createState() {
    return CharacterState(_character);
  }

}