part of 'bookmark_bloc_bloc.dart';

class BookmarkBlocState {
  UserBookMarked? userBookMarked;
  List<String> bookmarkedList = [];
  BookmarkBlocState({this.userBookMarked, required this.bookmarkedList});
}

class BookmarkBlocInitial extends BookmarkBlocState {
  BookmarkBlocInitial({required super.bookmarkedList});
}
