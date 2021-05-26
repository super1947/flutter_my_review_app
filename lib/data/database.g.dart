// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MyReviewData extends DataClass implements Insertable<MyReviewData> {
  final int id;
  final double stars;
  final String category;
  final String categoryDetail;
  final String title;
  final String content;
  final DateTime createdAt;
  MyReviewData(
      {required this.id,
      required this.stars,
      required this.category,
      required this.categoryDetail,
      required this.title,
      required this.content,
      required this.createdAt});
  factory MyReviewData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MyReviewData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      stars: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stars'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      categoryDetail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_detail'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['stars'] = Variable<double>(stars);
    map['category'] = Variable<String>(category);
    map['category_detail'] = Variable<String>(categoryDetail);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MyReviewCompanion toCompanion(bool nullToAbsent) {
    return MyReviewCompanion(
      id: Value(id),
      stars: Value(stars),
      category: Value(category),
      categoryDetail: Value(categoryDetail),
      title: Value(title),
      content: Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory MyReviewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MyReviewData(
      id: serializer.fromJson<int>(json['id']),
      stars: serializer.fromJson<double>(json['stars']),
      category: serializer.fromJson<String>(json['category']),
      categoryDetail: serializer.fromJson<String>(json['categoryDetail']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'stars': serializer.toJson<double>(stars),
      'category': serializer.toJson<String>(category),
      'categoryDetail': serializer.toJson<String>(categoryDetail),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MyReviewData copyWith(
          {int? id,
          double? stars,
          String? category,
          String? categoryDetail,
          String? title,
          String? content,
          DateTime? createdAt}) =>
      MyReviewData(
        id: id ?? this.id,
        stars: stars ?? this.stars,
        category: category ?? this.category,
        categoryDetail: categoryDetail ?? this.categoryDetail,
        title: title ?? this.title,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('MyReviewData(')
          ..write('id: $id, ')
          ..write('stars: $stars, ')
          ..write('category: $category, ')
          ..write('categoryDetail: $categoryDetail, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          stars.hashCode,
          $mrjc(
              category.hashCode,
              $mrjc(
                  categoryDetail.hashCode,
                  $mrjc(title.hashCode,
                      $mrjc(content.hashCode, createdAt.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyReviewData &&
          other.id == this.id &&
          other.stars == this.stars &&
          other.category == this.category &&
          other.categoryDetail == this.categoryDetail &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class MyReviewCompanion extends UpdateCompanion<MyReviewData> {
  final Value<int> id;
  final Value<double> stars;
  final Value<String> category;
  final Value<String> categoryDetail;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> createdAt;
  const MyReviewCompanion({
    this.id = const Value.absent(),
    this.stars = const Value.absent(),
    this.category = const Value.absent(),
    this.categoryDetail = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  MyReviewCompanion.insert({
    this.id = const Value.absent(),
    required double stars,
    required String category,
    required String categoryDetail,
    required String title,
    required String content,
    this.createdAt = const Value.absent(),
  })  : stars = Value(stars),
        category = Value(category),
        categoryDetail = Value(categoryDetail),
        title = Value(title),
        content = Value(content);
  static Insertable<MyReviewData> custom({
    Expression<int>? id,
    Expression<double>? stars,
    Expression<String>? category,
    Expression<String>? categoryDetail,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stars != null) 'stars': stars,
      if (category != null) 'category': category,
      if (categoryDetail != null) 'category_detail': categoryDetail,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  MyReviewCompanion copyWith(
      {Value<int>? id,
      Value<double>? stars,
      Value<String>? category,
      Value<String>? categoryDetail,
      Value<String>? title,
      Value<String>? content,
      Value<DateTime>? createdAt}) {
    return MyReviewCompanion(
      id: id ?? this.id,
      stars: stars ?? this.stars,
      category: category ?? this.category,
      categoryDetail: categoryDetail ?? this.categoryDetail,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stars.present) {
      map['stars'] = Variable<double>(stars.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (categoryDetail.present) {
      map['category_detail'] = Variable<String>(categoryDetail.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyReviewCompanion(')
          ..write('id: $id, ')
          ..write('stars: $stars, ')
          ..write('category: $category, ')
          ..write('categoryDetail: $categoryDetail, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MyReviewTable extends MyReview
    with TableInfo<$MyReviewTable, MyReviewData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MyReviewTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _starsMeta = const VerificationMeta('stars');
  @override
  late final GeneratedRealColumn stars = _constructStars();
  GeneratedRealColumn _constructStars() {
    return GeneratedRealColumn(
      'stars',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedTextColumn category = _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn('category', $tableName, false,
        minTextLength: 1, maxTextLength: 20);
  }

  final VerificationMeta _categoryDetailMeta =
      const VerificationMeta('categoryDetail');
  @override
  late final GeneratedTextColumn categoryDetail = _constructCategoryDetail();
  GeneratedTextColumn _constructCategoryDetail() {
    return GeneratedTextColumn('category_detail', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedDateTimeColumn createdAt = _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn('created_at', $tableName, false,
        defaultValue: Constant(DateTime.now()));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, stars, category, categoryDetail, title, content, createdAt];
  @override
  $MyReviewTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'my_review';
  @override
  final String actualTableName = 'my_review';
  @override
  VerificationContext validateIntegrity(Insertable<MyReviewData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stars')) {
      context.handle(
          _starsMeta, stars.isAcceptableOrUnknown(data['stars']!, _starsMeta));
    } else if (isInserting) {
      context.missing(_starsMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('category_detail')) {
      context.handle(
          _categoryDetailMeta,
          categoryDetail.isAcceptableOrUnknown(
              data['category_detail']!, _categoryDetailMeta));
    } else if (isInserting) {
      context.missing(_categoryDetailMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyReviewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MyReviewData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MyReviewTable createAlias(String alias) {
    return $MyReviewTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MyReviewTable myReview = $MyReviewTable(this);
  late final MyReviewDao myReviewDao = MyReviewDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [myReview];
}
