
class Health {

  int _max;
  int _current;
  int _temporary;

  Health(int max){
    this._max = max;
    this._current = max;
    this._temporary = 0;
  }

  Health.initWith(int max, int current, int temporary){
    this._max = max;
    this._current = current;
    this._temporary = temporary;
  }

  int get temporary => _temporary;

  int get current => _current;

  int get max => _max;

  void takeDamage(int damage){
    _current -= damage;
  }

}