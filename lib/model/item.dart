class KItem {
  late String id, name, desc, image, category;
  late int qty, price, ordered;
  late double discount;
  bool isAsset = false;

  KItem(
      {this.id = "",
      this.name = "",
      this.image = "",
      this.category = "",
      this.desc = "",
      this.qty = 0,
      this.price = 0,
      this.ordered = 0,
      this.discount = 0,
      this.isAsset = false});
}
