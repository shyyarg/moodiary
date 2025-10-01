import 'package:hive/hive.dart';

part 'journal_entry.g.dart';

@HiveType(typeId: 0)

class JournalEntry extends HiveObject {
  @HiveField(0)
  String emotion;

  @HiveField(1)
  String text;

  @HiveField(2)
  DateTime dateTime;

  JournalEntry({
    required this.emotion,
    required this.text,
    required this.dateTime
});

}
