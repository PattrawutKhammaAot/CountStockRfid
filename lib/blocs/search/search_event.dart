part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetListEvent extends SearchEvent {
  const GetListEvent(this.itemCode, this.offset, this.limit, this.filter);
  final String itemCode;
  final String filter;
  final int offset;
  final int limit;

  @override
  List<Object> get props => [itemCode, offset, limit, filter];
}

class DeleteByIDEvent extends SearchEvent {
  const DeleteByIDEvent(this.id);
  final int id;

  @override
  List<Object> get props => [id];
}
