import 'package:fav_app/model/fav_items.dart';

class FavRepo {
  Future<List<FavourtieListModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.from(_generateItems(10));
  }

  List<FavourtieListModel> _generateItems(int length) {
    return List.generate(
        length,
        (index) =>
            FavourtieListModel(id: index.toString(), value: 'item $index'));
  }
}
