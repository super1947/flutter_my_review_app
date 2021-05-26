import 'database.dart';
import 'package:moor/moor.dart';

part 'myreview.g.dart';

class MyReview extends Table {
  IntColumn? get id => integer().autoIncrement()();
  RealColumn? get stars => real()();
  TextColumn? get category => text().withLength(min: 1, max: 20)();
  TextColumn? get categoryDetail => text().withLength(min: 1, max: 30)();
  TextColumn? get title => text().withLength(min: 1, max: 30)();
  TextColumn? get content => text()();
  DateTimeColumn? get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

@UseDao(tables: [MyReview])
class MyReviewDao extends DatabaseAccessor<Database> with _$MyReviewDaoMixin {
  MyReviewDao(Database db) : super(db);

  Future<List<MyReviewData>> getAllData() => select(myReview).get();
  Stream<List<MyReviewData>> streamMyReviews() => select(myReview).watch();
  Stream<MyReviewData> streamMyReview(int id) =>
      (select(myReview)..where((tbl) => tbl.id.equals(id))).watchSingle();

  Future insertMyReview(MyReviewCompanion data) => into(myReview).insert(data);
}
