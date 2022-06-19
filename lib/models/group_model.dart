import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class GroupModel extends Equatable{
  final String? corpus;
  final int? course;
  final String? degree;
  final String? group;
  final List<Schedules>? schedules;

  GroupModel({this.corpus, this.course, this.degree, this.group, this.schedules});

  static GroupModel fromSnapshot(DocumentSnapshot snapshot) {
    GroupModel groupModel = GroupModel(
      corpus : snapshot['corpus'] ?? "нет данных",
      course : snapshot['course'] ?? 0,
      degree : snapshot['degree'] ?? "нет данных",
      group : snapshot['group'] ?? "нет данных",
      schedules :  (snapshot['schedules'] as List).map((e) => Schedules.fromMap(e)).toList(),
    );
    return groupModel;
  }
  static GroupModel fromMap(Map<String, dynamic> snapshot) {
    GroupModel groupModel = GroupModel(
      corpus : snapshot['corpus'] as String,
      course : snapshot['course'] as int,
      degree : snapshot['degree'] as String,
      group : snapshot['group'] as String,
      schedules :  (snapshot['schedules'] as List).map((e) => Schedules.fromMap(e)).toList(),
    );
    return groupModel;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['corpus'] = this.corpus;
    data['course'] = this.course;
    data['degree'] = this.degree;
    data['group'] = this.group;
    data['schedules'] = this.schedules!.map((v) => v.toJson()).toList();
    return data;
  }
  @override
  // TODO: implement props
  List<Object?> get props => [corpus, course, group, degree, schedules];

}

class Schedules extends Equatable{
  final List<DayWeek>? monday;
  final List<DayWeek>? tuesday;
  final List<DayWeek>? wednesday;
  final List<DayWeek>? thursday;
  final List<DayWeek>? friday;
  final List<DayWeek>? saturday;
  Schedules({this.monday, this.tuesday, this.wednesday, this.thursday, this.friday, this.saturday,});
  static Schedules fromMap(Map<String, dynamic> map){
    Schedules schedules = Schedules(
      monday: (map['monday'] as List).map((e) => DayWeek.fromMap(e)).toList(),
      tuesday: (map['tuesday'] as List).map((e) => DayWeek.fromMap(e)).toList(),
      wednesday: (map['wednesday'] as List).map((e) => DayWeek.fromMap(e)).toList(),
      thursday: (map['thursday'] as List).map((e) => DayWeek.fromMap(e)).toList(),
      friday: (map['friday'] as List).map((e) => DayWeek.fromMap(e)).toList(),
      saturday: (map['saturday'] as List).map((e) => DayWeek.fromMap(e)).toList(),
    );
    return schedules;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monday'] = this.monday!.map((v) => v.toJson()).toList();
    data['tuesday'] = this.tuesday!.map((v) => v.toJson()).toList();
    data['wednesday'] = this.wednesday!.map((v) => v.toJson()).toList();
    data['thursday'] = this.thursday!.map((v) => v.toJson()).toList();
    data['friday'] = this.friday!.map((v) => v.toJson()).toList();
    data['saturday'] = this.saturday!.map((v) => v.toJson()).toList();
    return data;
  }
  @override
  // TODO: implement props
  List<Object?> get props => [monday,tuesday,wednesday,thursday,friday,saturday];
}

class DayWeek extends Equatable{
  final String? lesson;
  final String? room;
  final String? teacher;
  final String? type;
  final String? index;

  DayWeek({this.lesson, this.room, this.teacher, this.type, this.index});

  static DayWeek fromMap(Map<String, dynamic> map) {
    DayWeek dayWeek = DayWeek(
      lesson : map['lesson'] ?? "нет данных",
      room : map['room'] ?? "нет данных",
      teacher : map['teacher'] ?? 'нет данных',
      type : map['type'] ?? "нет данных",
      index : map['index'] ?? "нет данных",
    );
    return dayWeek;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lesson'] = this.lesson;
    data['room'] = this.room;
    data['teacher'] = this.teacher;
    data['type'] = this.type;
    data['index'] = this.index;
    return data;
  }
  @override
  List<Object?> get props => [lesson, room, teacher, type, index];
}

