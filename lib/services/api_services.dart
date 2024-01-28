import 'package:dio/dio.dart';
import 'package:virt_task/constant/constant.dart';
import 'package:virt_task/model/short_link_response_model.dart';

class ApiServices{
  final dio = Dio();

  Future<ShortLinkResponseModel> shortLink({required String longLink}) async {
    final response = await dio.post(baseUrl,data: {
      "destination": longLink,
      "domain": {"fullName": "rebrand.ly"},
    },options: Options(headers: {
      "Content-Type": "application/json",
      "apikey" : "c296af3f9ab44a6aa08306ebb3454886",
    }));

    return ShortLinkResponseModel.fromJson(response.data);
  }
}