import 'package:bloc/bloc.dart';
import 'package:countstock_rfid/app.dart';
import 'package:countstock_rfid/modelResponse/DefaultResponse.dart';
import 'package:equatable/equatable.dart';

import '../../database/database.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
