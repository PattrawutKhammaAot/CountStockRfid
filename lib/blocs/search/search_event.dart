part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSerachEvent extends SearchEvent {
  const GetSerachEvent(this.itemCode);
  final String itemCode;

  @override
  List<Object> get props => [itemCode];
}
