import 'package:hive/hive.dart';
import 'package:journal_app/model/journal_entry.dart';

class JournalDatabase {

  final Box<JournalEntry> journalBox = Hive.box<JournalEntry>('entries');


  /// Create journal and then store to Hive.
  void createJournalEntry({required String emotion,required String text,required DateTime dateTime}){
    JournalEntry newEntry = JournalEntry(emotion: emotion, text: text, dateTime: dateTime);
    journalBox.add(newEntry);
  }

  ///Delete journal.
  void deleteJournalEntry({required JournalEntry entry}){
    journalBox.delete(entry);
  }

  ///Update journal.
  void updateJournalEntry(JournalEntry entry, {String? text, String? emotion}) {
    if (text != null) entry.text = text;
    if (emotion != null) entry.emotion = emotion;
    entry.save();
  }


  ///Get journals by day.
  List<JournalEntry> getJournalByDay(DateTime date) {
    //Filtering journals by year, month, day.
    final journalsForDay = journalBox.values.where((journal) =>
    journal.dateTime.year == date.year &&
        journal.dateTime.month == date.month &&
        journal.dateTime.day == date.day
    ).toList();

    return journalsForDay;
  }

  ///Get journals by month.
  List<JournalEntry> getJournalByMonth(DateTime date) {
    //Filtering journals by year, month, day.
    final journalsForDay = journalBox.values.where((journal) =>
    journal.dateTime.year == date.year &&
        journal.dateTime.month == date.month
    ).toList();

    return journalsForDay;
  }


}