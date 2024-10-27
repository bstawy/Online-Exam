class Exam {
  final String id;
  final String level;
  final int questionCount;
  final double fromTime;
  final double toTime;
  final int durationMinutes;

  const Exam({
    required this.id,
    required this.level,
    required this.questionCount,
    required this.fromTime,
    required this.toTime,
    required this.durationMinutes,
  });
}
