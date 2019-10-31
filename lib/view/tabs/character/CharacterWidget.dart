
import 'package:dndlion/model/Character.dart';
import 'package:dndlion/view/tabs/character/CharacterState.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatefulWidget {

  final Character character;

  const CharacterWidget({Key key, this.character}): super(key: key);

  @override
  CharacterState createState() {
    return CharacterState(character);
  }

}