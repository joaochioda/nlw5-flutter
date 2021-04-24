import 'dart:convert';

import 'answer_model.dart';

class QuestioModel {
  final String title;
  final List<AnswerModel> answers;

  QuestioModel({required this.title, required this.answers})
      : assert(answers.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestioModel.fromMap(Map<String, dynamic> map) {
    return QuestioModel(
      title: map['title'],
      answers: List<AnswerModel>.from(
          map['answers']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestioModel.fromJson(String source) =>
      QuestioModel.fromMap(json.decode(source));
}
