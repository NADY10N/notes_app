import 'package:flutter/material.dart';

import 'package:notes/views/widgets/custom_buttom.dart';
import 'package:notes/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            CustomTextfield(
              hint: "Title",
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextfield(
              hint: "Contet",
              maxLines: 5,
            ),
            SizedBox(
              height: 32,
            ),
            CustomButton(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
