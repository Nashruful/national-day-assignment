class QuestionModels {
  QuestionModels({
    required this.id,
    required this.question,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.answer,
  });
  final int? id;
  final String? question;
  final String? a;
  final String? b;
  final String? c;
  final String? d;
  final String? answer;

  factory QuestionModels.fromJson(Map<String, dynamic> json) {
    return QuestionModels(
      id: json['id'],
      question: json["question"],
      a: json["A"],
      b: json["B"],
      c: json["C"],
      d: json["D"],
      answer: json["answer"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "A": a,
        "B": b,
        "C": c,
        "D": d,
        "answer": answer
      };
}
