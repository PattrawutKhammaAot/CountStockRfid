part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<TransactionsDBData>? data;
  final FetchStatus status;
  final DefaultResponse? dataDefaultResponse;
  final String message;
  const SearchState(
      {this.data,
      this.status = FetchStatus.init,
      this.message = '',
      this.dataDefaultResponse});

  SearchState copyWith(
      {List<TransactionsDBData>? data,
      FetchStatus? status,
      String? message,
      DefaultResponse? dataDefaultResponse}) {
    return SearchState(
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

final class SearchInitial extends SearchState {}
