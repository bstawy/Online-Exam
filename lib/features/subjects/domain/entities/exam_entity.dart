class Exam {
  final String id;
  final String title;
  final num duration;
  final String subjectId;
  final num numberOfQuestions;
  final bool isActive;

  const Exam({
    required this.id,
    required this.title,
    required this.duration,
    required this.subjectId,
    required this.numberOfQuestions,
    required this.isActive,
  });
}
