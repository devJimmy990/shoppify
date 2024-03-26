import 'item.dart';

class KCategory{
  late String id, name, image;
  List<KItem> items =[];

  KCategory({this.id = "", this.name = "", this.image = ""});
}