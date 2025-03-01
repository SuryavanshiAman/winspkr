import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:wins_pkr/jilli_dir/modal/games_grid_model.dart';
import 'package:wins_pkr/res/api_urls.dart';
import 'package:wins_pkr/res/launcher.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class JilliViewModal with ChangeNotifier {
  int? responseStatusCode;
  List<JilliGamesGridModel> jiliGamesList = [];

  Future<void> jilliGameList() async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.jiliGameList),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "user_id": userId.toString(),
        }),
      );

      if (kDebugMode) {
        print(ApiUrl.jiliGameList);
      }

      // Update status code
      responseStatusCode = response.statusCode;
      notifyListeners();

      if (response.statusCode == 200) {
        // Parse the response data
        final List<dynamic> responseData = json.decode(response.body)['data'];
        jiliGamesList = responseData
            .map((item) => JilliGamesGridModel.fromJson(item))
            .toList();
        notifyListeners(); // Notify listeners about data change
        if (kDebugMode) {
          print(response);
        }
      } else if (response.statusCode == 400) {
        if (kDebugMode) {
          print('Error 400: Bad Request.');
        }
      } else {
        // Handle other response errors
        jiliGamesList = [];
        notifyListeners(); // Notify listeners about data change
        if (kDebugMode) {
          print('Error ${response.statusCode}: ${response.reasonPhrase}');
        }
      }
    } catch (e) {
      // Handle unexpected errors
      jiliGamesList = [];
      notifyListeners(); // Notify listeners about data change
      if (kDebugMode) {
        print('Exception occurred: $e');
      }
    }
  }


  getGameUrl( context,String gameId) async {
    try {
      UserViewModel userViewModal = UserViewModel();
      String? userId = await userViewModal.getUser();

      final response = await http.post(
        Uri.parse(ApiUrl.getGameUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "game_id": gameId,
          "user_id": userId.toString(),
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data["status"] == 200) {
          final String? gameUrl = data["game_url"];
          if (gameUrl != null && gameUrl.isNotEmpty) {
            Launcher.launchOnWeb(context, gameUrl);

                await updateMainWallet(context);

          }
        } else {
          Utils.flushBarErrorMessage(
              data["message"] ?? "Something went wrong.", context);
        }
      } else {
        Utils.flushBarErrorMessage(
            "Failed to fetch data. HTTP Status: ${response.statusCode}",
            context);
      }
    } catch (e) {
      Utils.flushBarErrorMessage("An error occurred: $e", context);
    }
  }

  updateMainWallet(context) async {

    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();

    final response = await http.post(
      Uri.parse(ApiUrl.updateMainWallet),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_id": userId.toString(),
      }),
    );
    var data = jsonDecode(response.body);
    if (data["status"] == 200) {
      Provider.of<ProfileViewModel>(context, listen: false).userProfileApi(context);

      return Utils.flushBarSuccessMessage(data['message'], context, );
    } else if (data["status"] == 401) {
      Utils.flushBarErrorMessage(data['message'], context, );
    } else {
      Utils.flushBarErrorMessage(data['message'], context, );
    }
  }



}
