import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(InitialNoteState());
  int indexOfColor = 0;

  List<NoteModel>? notes;
  void fetchAllNotes() {
    var notesOfBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesOfBox.values.toList();
    emit(SuccessState());
  }
}
