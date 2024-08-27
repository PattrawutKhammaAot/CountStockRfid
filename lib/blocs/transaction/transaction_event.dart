part of 'transaction_bloc.dart';

class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class ScanEvent extends TransactionEvent {
  const ScanEvent(this.barcode);
  final String barcode;

  @override
  List<Object> get props => [barcode];
}
