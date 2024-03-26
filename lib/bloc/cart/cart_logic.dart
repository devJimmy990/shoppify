import 'package:bloc/bloc.dart';
import 'package:online_store/bloc/cart/cart_state.dart';
import '../../model/item.dart';

class CartLogic extends Cubit<CartState> {
  CartLogic() : super(InitCartState());
  int qtyCounter = 1;
  int total = 0;
  double totalDiscount = 0;
  static List<KItem> cartItems = [];

  getCartItemQty({required KItem item}) {
    for (KItem itm in getCartItems()) {
      if (itm.id == item.id) {
        emit(GetCartItemQty());
        return itm.ordered;
      }
    }
    return 0;
  }

  calcCartTotal() {
    total =0;
    totalDiscount=0;
    for (KItem item in cartItems) {
      total += item.price * item.ordered;
      totalDiscount += item.discount > 0
          ? (item.price * (1 - item.discount) * item.ordered)
          : item.price * item.ordered;
    }
  }

  clearCartItems() {
    cartItems.clear();
    emit(ClearCart());
  }


  increaseQtyCounter({required int max}) {
    if (qtyCounter < max) qtyCounter++;
    emit(IncreaseQtyCounter());
  }
  decreaseQtyCounter() {
    if (qtyCounter > 1) qtyCounter--;
    emit(DecreaseQtyCounter());
  }

  increaseItemQty({required KItem item}) {
    for (KItem itm in cartItems) {
      if (itm.id == item.id) {
        if(itm.ordered<itm.qty){
          ++itm.ordered;
          print("Heeeeeeeeeeeeeeey:- ${itm.ordered}");
          emit(IncreaseCartQty());
          getCartItemQty(item: item);
          calcCartTotal();
          break;
        }
      }
    }
  }

  decreaseItemQty({required KItem item}) {
    for (KItem itm in cartItems) {
      if (itm.id == item.id) {
        if(itm.ordered>1){
          --itm.ordered;
          emit(DecreaseCartQty());
          getCartItemQty(item: item);
          calcCartTotal();
          break;
        }
        else {
          print("heeeeeeeeeeeey");
          switch(cartItems.length>1){
            case true:cartItems.remove(itm);          print("remove");
            break;
            case false:cartItems.clear();           print("clear");
            break;

          }
          emit(DeleteCartItem());        }
        break;
      }
    }

    getCartItems();
  }

  deleteCartItem(int index){
    cartItems.removeAt(index);
    emit(DeleteCartItem());
  }
  addCartItem(KItem item) {
    bool isFound = false;
    if (cartItems.isEmpty) {
      cartItems.add(item);
    } else {
      for (KItem itm in cartItems) {
        if (itm.id == item.id) {  isFound = true; itm.qty += item.qty; break;  }
      }
      if(!isFound){ cartItems.add(item);}
    }
    emit(InsertCartItem());
    getCartItems();
    calcCartTotal();
  }

  List<KItem> getCartItems() {
    calcCartTotal();
    return cartItems;
  }
}
