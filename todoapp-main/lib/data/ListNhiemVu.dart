import 'package:todoapp/data/NhiemVu.dart';

class ListNhiemVu {
  List<NhiemVu> listNhiemVu = [];

  ListNhiemVu.internal();
  static final _listNhiemVu = ListNhiemVu.internal();

  List<NhiemVu> getNhiemVu() {
    return listNhiemVu;
  }

  factory ListNhiemVu() {
    return _listNhiemVu;
  }
}
