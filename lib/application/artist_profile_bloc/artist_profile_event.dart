part of 'artist_profile_bloc.dart';

class ArtistProfileEvent {}

class ChangePhotoButtonClicked extends ArtistProfileEvent {}

class SaveButtonClicked extends ArtistProfileEvent {
  List<dynamic>? interests;
  List<dynamic>? languages;
  String? photo;
  String? name;
  String? age;
  String? gender;
  String? bio;
  SaveButtonClicked(
      {this.interests,
      this.photo,
      this.name,
      this.age,
      this.gender,
      this.languages, this.bio});
}
