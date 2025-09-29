import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Views/widgets/custom_note_item.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';

class CustomSearch extends SearchDelegate {
  List<NoteModel>? notes;

  CustomSearch({required this.notes});

  List<NoteModel>? filterNotes = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return StatefulBuilder(builder: (context, setState) {
        return ListView.builder(
            itemCount: notes!.length,
            itemBuilder: (context, index) {
              return NoteItem(
                  note: notes![index],
                  onUpdateCallbackFunction: () {
                    setState(() {
                      notes = context.read<NotesCubit>().notes;
                    });
                  });
            });
      });
    } else {
      filterNotes = notes!.where((note) {
        return (note.title).toLowerCase().contains(query.toLowerCase());
      }).toList();

      return StatefulBuilder(builder: (context, setState) {
        return ListView.builder(
            itemCount: filterNotes!.length,
            itemBuilder: (context, index) {
              return NoteItem(
                note: filterNotes![index],
                onUpdateCallbackFunction: () {
                  setState(() {
                    notes = context.read<NotesCubit>().notes;
                    filterNotes = notes!.where((note) {
                      return (note.title)
                          .toLowerCase()
                          .contains(query.toLowerCase());
                    }).toList();
                  });
                },
              );
            });
      });
    }
  }
}
