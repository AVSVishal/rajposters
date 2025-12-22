class Note {
  final int? id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> tags;
  final String category;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.tags = const [],
    this.category = '',
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at'] ?? 0),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updated_at'] ?? 0),
      tags: List<String>.from(json['tags'] ?? []),
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
      'tags': tags,
      'category': category,
    };
  }

  Note copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? tags,
    String? category,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tags: tags ?? this.tags,
      category: category ?? this.category,
    );
  }
}

class QuizQuestion {
  final int? id;
  final int noteId;
  final String question;
  final List<String> options;
  final int correctAnswer;
  final DateTime createdAt;
  final String difficulty;
  final String category;

  QuizQuestion({
    this.id,
    required this.noteId,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.createdAt,
    this.difficulty = 'medium',
    this.category = '',
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'],
      noteId: json['note_id'] ?? 0,
      question: json['question'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      correctAnswer: json['correct_answer'] ?? 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at'] ?? 0),
      difficulty: json['difficulty'] ?? 'medium',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'note_id': noteId,
      'question': question,
      'options': options,
      'correct_answer': correctAnswer,
      'created_at': createdAt.millisecondsSinceEpoch,
      'difficulty': difficulty,
      'category': category,
    };
  }
}

class Quiz {
  final int? id;
  final String title;
  final String description;
  final List<QuizQuestion> questions;
  final DateTime createdAt;
  final int timeLimit; // in minutes
  final String category;

  Quiz({
    this.id,
    required this.title,
    required this.description,
    required this.questions,
    required this.createdAt,
    this.timeLimit = 30,
    this.category = '',
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      questions: (json['questions'] as List<dynamic>?)
          ?.map((q) => QuizQuestion.fromJson(q))
          .toList() ?? [],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at'] ?? 0),
      timeLimit: json['time_limit'] ?? 30,
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'questions': questions.map((q) => q.toJson()).toList(),
      'created_at': createdAt.millisecondsSinceEpoch,
      'time_limit': timeLimit,
      'category': category,
    };
  }
}

class QuizResult {
  final int? id;
  final int quizId;
  final int score;
  final int totalQuestions;
  final int timeSpent; // in seconds
  final DateTime completedAt;
  final Map<int, int> answers; // questionId -> selectedAnswer

  QuizResult({
    this.id,
    required this.quizId,
    required this.score,
    required this.totalQuestions,
    required this.timeSpent,
    required this.completedAt,
    required this.answers,
  });

  factory QuizResult.fromJson(Map<String, dynamic> json) {
    return QuizResult(
      id: json['id'],
      quizId: json['quiz_id'] ?? 0,
      score: json['score'] ?? 0,
      totalQuestions: json['total_questions'] ?? 0,
      timeSpent: json['time_spent'] ?? 0,
      completedAt: DateTime.fromMillisecondsSinceEpoch(json['completed_at'] ?? 0),
      answers: Map<int, int>.from(json['answers'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quiz_id': quizId,
      'score': score,
      'total_questions': totalQuestions,
      'time_spent': timeSpent,
      'completed_at': completedAt.millisecondsSinceEpoch,
      'answers': answers,
    };
  }

  double get percentage => totalQuestions > 0 ? (score / totalQuestions) * 100 : 0;
}