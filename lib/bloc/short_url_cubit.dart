import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virt_task/model/short_link_response_model.dart';
import 'package:virt_task/services/api_services.dart';

class ShortUrlCubit extends Cubit<ShortUrlCubitState> {
  ShortUrlCubit() : super(ShortUrlCubitState());

  Future<void> shortLink(String longLink) async {
    try {
      emit(ShortUrlCubitState(status: 1));
      final shortLinkModel = await ApiServices().shortLink(longLink: longLink);
      emit(
        state.copyWith(
          shortUrlModel: shortLinkModel,
          status: 2,
        ),
      );
      // print(shortLinkModel.shortUrl);
    } catch (e) {
      // throw e;e
      emit(ShortUrlCubitState(status: 3));
    }
  }
}

class ShortUrlCubitState {
  ShortLinkResponseModel? shortUrlModel;
  int? status;

  ShortUrlCubitState({
    //status 0 = initial , 1= loading, 2= loaded, 3=error
    this.status = 0,
    this.shortUrlModel,
  });

  ShortUrlCubitState copyWith({
    ShortLinkResponseModel? shortUrlModel,
    int? status,
  }) {
    return ShortUrlCubitState(
      status: status ?? this.status,
      shortUrlModel: shortUrlModel ?? this.shortUrlModel,
    );
  }
}
