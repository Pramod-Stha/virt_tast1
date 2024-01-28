import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:virt_task/model/short_link_response_model.dart';

class ShortUrlWithQrView extends StatelessWidget {
  const ShortUrlWithQrView({super.key, required this.data });
  final ShortLinkResponseModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Short Url : ${data.shortUrl}"),
          QrImageView(
            data: data.shortUrl,
            version: QrVersions.auto,
            size: 200.0,
          ),
          const SizedBox(
            height: 30,
          ),
          Text("Long Url : ${data.destination}"),
        ],
      ),
    );
  }
}
