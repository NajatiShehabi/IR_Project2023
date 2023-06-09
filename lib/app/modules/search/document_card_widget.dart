import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ir_project/app/routes/app_pages.dart';

class DocumentCardWidget extends StatelessWidget {
  const DocumentCardWidget(
      {super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.DOCUMENT_DETAILS,
            parameters: {'title': title, 'content': body});
      },
      child: ListTile(
        title: Text(
          'File Name: $title',
          style: context.textTheme.headlineLarge!.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          'Content: $body',
          style: context.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
