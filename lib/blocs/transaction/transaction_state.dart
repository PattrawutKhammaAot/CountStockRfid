part of 'transaction_bloc.dart';

class TransactionState extends Equatable {
  final List<TransactionsDBData>? data;
  final FetchStatus status;
  final DefaultResponse? dataDefaultResponse;
  final String message;
  const TransactionState(
      {this.data,
      this.status = FetchStatus.init,
      this.message = '',
      this.dataDefaultResponse});

  TransactionState copyWith(
      {List<TransactionsDBData>? data,
      FetchStatus? status,
      String? message,
      DefaultResponse? dataDefaultResponse}) {
    return TransactionState(
        data: data = data ?? this.data,
        status: status = status ?? this.status,
        message: message = message ?? this.message,
        dataDefaultResponse: dataDefaultResponse =
            dataDefaultResponse ?? this.dataDefaultResponse);
  }

  @override
  List<Object> get props => [
        status,
        message,
      ];
}

final class TransactionInitial extends TransactionState {}
