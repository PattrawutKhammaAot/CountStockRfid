part of 'search_rfid_bloc.dart';

class SearchRfidState extends Equatable {
  final List<Tag_Running_RfidData>? data;
  final FetchStatus status;
  final DefaultResponse? dataDefaultResponse;
  final String message;
  const SearchRfidState(
      {this.data,
      this.status = FetchStatus.init,
      this.message = '',
      this.dataDefaultResponse});

  SearchRfidState copyWith(
      {List<Tag_Running_RfidData>? data,
      FetchStatus? status,
      String? message,
      DefaultResponse? dataDefaultResponse}) {
    return SearchRfidState(
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

class SearchRfidInitial extends SearchRfidState {
  @override
  List<Object> get props => [];
}
