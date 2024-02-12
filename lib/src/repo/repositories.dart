
import 'dart:convert';
import 'package:http/http.dart';
import 'package:kanbanboardapp/src/model/user_model.dart';

// UserRepository sınıfı, kullanıcı verilerini çekmek için harici bir API'yi kullanır
class UserRepository {
  // API'nin endpoint'i
  String endpoint = "https://reqres.in/api/users?page=2";

  // Kullanıcı verilerini çekmek için asenkron bir fonksiyon
  Future<List<UserModel>> getUsers() async {
    // HTTP GET isteği yapılır ve cevap beklenir
    Response response = await get(Uri.parse(endpoint));

    // HTTP cevabının durumu kontrol edilir
    if (response.statusCode == 200) {
      // JSON verisi çözümlenir ve UserModel listesine dönüştürülür
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      // Hata durumunda istisna fırlatılır
      throw Exception(response.reasonPhrase);
    }
  }
}
