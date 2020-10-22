class Gorevler{
  int no;
  String _gorev;

  Gorevler(this._gorev);

  Gorevler.map(dynamic nsne) {
    this._gorev = nsne["gorev"];
  }

  String get gorev => _gorev;

  Map<String, dynamic> haritayap() {
    var map = Map<String, dynamic>();
    map["gorev"] = _gorev;
    return map;
  }
  
  void numaraVer(int no) {
    this.no = no;
  }
}