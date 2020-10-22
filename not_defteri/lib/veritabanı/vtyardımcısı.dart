import 'package:not_defteri/veritaban%C4%B1/gorevler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;


class Vtyardimcisi {
  static final Vtyardimcisi _yardimci = Vtyardimcisi.icislem();

  Vtyardimcisi.icislem();

  factory Vtyardimcisi() => _yardimci;

  static Database _vt;

  Future<Database> get veritabani async {
    if (_vt != null ) return _vt;
    _vt = await olusturvt();
    return _vt;
  }

  olusturvt() async {
    io.Directory dosyakonum = await getApplicationDocumentsDirectory();
    String yol = join(dosyakonum.path, "görevler.db");
    var veritabani = await openDatabase(yol, version: 1, onCreate: _ilkAcilis);
    return veritabani;
  }
  
  _ilkAcilis(Database vt, int versiyon) async {
    await vt.execute("CREATE TABLE Gorevler(no INTEGER PRIMARY KEY AUTOINCREMENT, gorev TEXT)");
  }
  Future<int> gorevlerKaydet(Gorevler grovler) async {
    var veritab = await veritabani;
    int cvp = await veritab.insert("Gorevler", grovler.haritayap());
    return cvp;
  }

  Future<List<Gorevler>> gorevlerGetir() async {
    var veritab = await veritabani;

    List<Map> liste = await veritab.rawQuery("SELECT * FROM Gorevler");
    List<Gorevler> yeniliste = List();
    
    for(int i = 0; i < liste.length; i++) {
      var task = Gorevler(liste[i]["gorev"]);
      task.numaraVer(liste[i]["no"]);
      yeniliste.add(task);
    }
    return yeniliste;

  }

  Future<int> gorevSil(Gorevler grovler) async{
        var veritab = await veritabani;
        int cvp = await veritab.rawDelete("DELETE FROM Gorevler WHERE no = ?", [grovler.no]);
        return cvp;
  }

    Future<bool> gorevGuncelle(Gorevler grovler) async{
        var veritab = await veritabani;
        int cvp = await veritab.update("Gorevler", grovler.haritayap(),
        where: "no = ?", whereArgs: <int>[grovler.no]);
        return cvp > 0 ? true: false;
    }

}