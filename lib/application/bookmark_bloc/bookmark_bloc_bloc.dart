import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cinefy/infrastructure/api_calls/base_client.dart' as api_calls;
import 'package:http/http.dart' as http;

import '../../core/constants.dart';
import '../../domain/bookmarked/bookmarked_model.dart';
import '../../infrastructure/Functions/current_user_functions.dart';
import '../../infrastructure/Models/current_user.dart';

part 'bookmark_bloc_event.dart';
part 'bookmark_bloc_state.dart';

class BookmarkBlocBloc extends Bloc<BookmarkBlocEvent, BookmarkBlocState> {
  BookmarkBlocBloc() : super(BookmarkBlocInitial(bookmarkedList: [])) {
    on<LoadBookmarks>((event, emit) async {
      List<CurrentUserModel> userdetails = await getAllUsers();
      String userID = userdetails[0].id!;
      http.Response? response =
          await api_calls.BaseClient().bookmarkApi(userID);
      state.bookmarkedList.clear();
      if (response != null) {
        var data = jsonDecode(response.body);
        UserBookMarked userBookMarked = UserBookMarked.fromJson(data);
        for (int i = 0; i < userBookMarked.data!.length; i++) {
          state.bookmarkedList.add(userBookMarked.data![i].sId!);
        }
        print('bookmarked length : ${state.bookmarkedList.length}');
        emit(BookmarkBlocState(
            userBookMarked: userBookMarked,
            bookmarkedList: state.bookmarkedList));
      } else {
        print('bookmark failed');
      }
    });

    on<RefreshBookmark>((event, emit) {
      emit(BookmarkBlocState(
          bookmarkedList: state.bookmarkedList,
          userBookMarked: state.userBookMarked));
    });

    on<BookmarkPost>((event, emit) async {
      await addBookmark(event.userID, event.postID);
      http.Response? response =
          await api_calls.BaseClient().bookmarkApi(event.userID);
      state.bookmarkedList.clear();
      if (response != null) {
        var data = jsonDecode(response.body);
        UserBookMarked userBookMarked = UserBookMarked.fromJson(data);
        for (int i = 0; i < userBookMarked.data!.length; i++) {
          state.bookmarkedList.add(userBookMarked.data![i].sId!);
        }
        print('bookmarked length : ${state.bookmarkedList.length}');
        emit(BookmarkBlocState(
            userBookMarked: userBookMarked,
            bookmarkedList: state.bookmarkedList));
      } else {
        print('bookmark failed');
      }
    });
  }
  addBookmark(String userID, String postID) async {
    final urlEndPoint = '/bookmark?id=$postID&user=$userID';
    final url = apiBase + urlEndPoint;
    final response = await http.patch(Uri.parse(url));
    print('bookmarked status code : ${response.statusCode}');
  }
}
