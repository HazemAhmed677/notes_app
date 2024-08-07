import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
    required this.notes,
  });
  final List<NoteModel>? notes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return (state is SuccessState)
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: notes?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                    top: 4,
                  ),
                  child: NoteItem(
                    note: notes![index],
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
