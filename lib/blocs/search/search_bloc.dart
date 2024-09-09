import 'package:bloc/bloc.dart';
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
    // on<GetSerachEvent>((event, emit) async {
    //   try {
    //     emit(state.copyWith(status: FetchStatus.fetching));
    //     var result = await transDB.search(event.itemCode);
    //     if (result.isNotEmpty) {
    //       emit(state.copyWith(status: FetchStatus.saved, data: result));
    //     } else {
    //       emit(state.copyWith(
    //           status: FetchStatus.failed, message: "No data found"));
    //     }
    //   } catch (e, s) {
    //     print("$e$s");
    //     emit(state.copyWith(status: FetchStatus.failed, message: e.toString()));
    //   }
    // });
  }
}
