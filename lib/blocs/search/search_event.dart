part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetListEvent extends SearchEvent {
  const GetListEvent(this.itemCode);
  final String itemCode;

  @override
  List<Object> get props => [itemCode];
}

class DeleteByIDEvent extends SearchEvent {
  const DeleteByIDEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
