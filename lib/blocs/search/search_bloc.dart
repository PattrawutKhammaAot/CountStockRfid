import 'package:bloc/bloc.dart';
import 'package:countstock_rfid/database/searchDB.dart';
import 'package:equatable/equatable.dart';
import 'package:countstock_rfid/main.dart';

import '../../app.dart';
import '../../database/database.dart';
import '../../modelResponse/DefaultResponse.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetListEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: FetchStatus.fetching));
        var result = await SearchDB().serachResult(
            event.itemCode, event.offset, event.limit, event.filter);
        if (result.isNotEmpty) {
          emit(state.copyWith(status: FetchStatus.success, data: result));
        } else {
          emit(state.copyWith(
              status: FetchStatus.failed, message: "No data found"));
        }
      } catch (e, s) {
        print("$e$s");
        emit(state.copyWith(status: FetchStatus.failed, message: e.toString()));
      }
    });
    on<DeleteByIDEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: FetchStatus.fetching));
        var result = await SearchDB().deleteByID(event.id);
        if (result) {
          emit(state.copyWith(status: FetchStatus.deleteSuccess));
        } else {
          emit(state.copyWith(
              status: FetchStatus.failed, message: "No data found"));
        }
      } catch (e, s) {
        print("$e$s");
        emit(state.copyWith(status: FetchStatus.failed, message: e.toString()));
      }
    });
  }
}
