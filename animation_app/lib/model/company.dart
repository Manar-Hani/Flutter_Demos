import 'package:meta/meta.dart';

class Company {
  Company(
      {@required this.name,
      @required this.about,
      @required this.backdropPhoto,
      @required this.courses,
      @required this.location,
      @required this.logo,
      @required this.president});

  final String name;
  final String president;
  final String location;
  final String logo;
  final String backdropPhoto;
  final String about;
  final List<Course> courses;
}

class Course {
  Course({@required this.title, @required this.thumbnail, @required this.url});
  final String title;
  final String thumbnail;
  final String url;


}