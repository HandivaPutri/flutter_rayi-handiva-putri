import 'package:bloc/bloc.dart';
import 'package:contact/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<ContactEvent>(
      (event, emit) {
        emit(
          ContactLoaded(
            data: [
              TaskModel(
                id: "1",
                Name: "Jojo",
                Contact: "082134567321",
              ),
              TaskModel(
                id: "2",
                Name: "Snowy",
                Contact: "087889763422",
              ),
              TaskModel(
                id: "3",
                Name: "Bocil",
                Contact: "085678343576",
              ),
            ],
          ),
        );
      },
    );
    on<addTask>((event, emit) {
      final state = this.state as ContactLoaded;
      emit(ContactLoaded(
        data: [...state.data, event.contact],
      ));
    });
  }
}
