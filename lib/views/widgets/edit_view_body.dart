import 'package:flutter/material.dart';
import 'package:notes/views/widgets/custom_app_bar.dart';
import 'package:notes/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppBar(
              title: "Edit Note",
              icon: Icons.check,
            ),
            CustomTextfield(hint: "Title"),
            SizedBox(
              height: 16,
            ),
            CustomTextfield(
              hint: "Content",
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
