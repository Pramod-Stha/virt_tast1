import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:virt_task/bloc/short_url_cubit.dart';
import 'package:virt_task/widget/short_url_with_qr_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final longLinkController = TextEditingController();

  @override
  void dispose() {
    longLinkController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Vrit Task"),
      ),
      body: BlocBuilder<ShortUrlCubit, ShortUrlCubitState>(
        builder: (context, state) {
          if (state.status == 1) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == 2 && state.shortUrlModel != null) {
            return ShortUrlWithQrView(data: state.shortUrlModel!);
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Enter a long link"),
                TextFormField(
                  controller: longLinkController,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ShortUrlCubit>().shortLink(longLinkController.text.trim());
                  },
                  child: const Text(
                    "Short the link",
                  ),
                ),
                if (state.shortUrlModel != null) Text(state.shortUrlModel!.shortUrl)
              ],
            ),
          );
        },
      ),
    );
  }
}
