part of 'bookmark_bloc_bloc.dart';

class BookmarkBlocEvent {}

class LoadBookmarks extends BookmarkBlocEvent {
  LoadBookmarks();
}

class RefreshBookmark extends BookmarkBlocEvent {}

class BookmarkPost extends BookmarkBlocEvent {
  String userID;
  String postID;
  BookmarkPost({required this.postID, required this.userID});
}
