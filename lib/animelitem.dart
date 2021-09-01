import 'package:meta/meta.dart';

class Animal{
  String? imagepath;
  String? animalname;
  String? kind;
  bool? flyExist = false;
  //이미경로
  //동물이름
  //종류
  //날수있는가 못나는가
  Animal({
      this.imagepath, this.animalname, this.kind, this.flyExist});
}