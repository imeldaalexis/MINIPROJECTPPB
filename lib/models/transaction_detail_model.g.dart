// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTransactionDetailModelCollection on Isar {
  IsarCollection<TransactionDetailModel> get transactionDetailModels =>
      this.collection();
}

const TransactionDetailModelSchema = CollectionSchema(
  name: r'TransactionDetailModel',
  id: -2704558612467214693,
  properties: {
    r'firestoreId': PropertySchema(
      id: 0,
      name: r'firestoreId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 1,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'menuFirestoreId': PropertySchema(
      id: 2,
      name: r'menuFirestoreId',
      type: IsarType.string,
    ),
    r'menuName': PropertySchema(
      id: 3,
      name: r'menuName',
      type: IsarType.string,
    ),
    r'menuPrice': PropertySchema(
      id: 4,
      name: r'menuPrice',
      type: IsarType.double,
    ),
    r'quantity': PropertySchema(
      id: 5,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'transactionFirestoreId': PropertySchema(
      id: 6,
      name: r'transactionFirestoreId',
      type: IsarType.string,
    )
  },
  estimateSize: _transactionDetailModelEstimateSize,
  serialize: _transactionDetailModelSerialize,
  deserialize: _transactionDetailModelDeserialize,
  deserializeProp: _transactionDetailModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'firestoreId': IndexSchema(
      id: 1863077355534729001,
      name: r'firestoreId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'firestoreId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'transaction': LinkSchema(
      id: -2177456304722088155,
      name: r'transaction',
      target: r'TransactionModel',
      single: true,
      linkName: r'details',
    )
  },
  embeddedSchemas: {},
  getId: _transactionDetailModelGetId,
  getLinks: _transactionDetailModelGetLinks,
  attach: _transactionDetailModelAttach,
  version: '3.1.0+1',
);

int _transactionDetailModelEstimateSize(
  TransactionDetailModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.firestoreId.length * 3;
  bytesCount += 3 + object.menuFirestoreId.length * 3;
  bytesCount += 3 + object.menuName.length * 3;
  bytesCount += 3 + object.transactionFirestoreId.length * 3;
  return bytesCount;
}

void _transactionDetailModelSerialize(
  TransactionDetailModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.firestoreId);
  writer.writeBool(offsets[1], object.isSynced);
  writer.writeString(offsets[2], object.menuFirestoreId);
  writer.writeString(offsets[3], object.menuName);
  writer.writeDouble(offsets[4], object.menuPrice);
  writer.writeLong(offsets[5], object.quantity);
  writer.writeString(offsets[6], object.transactionFirestoreId);
}

TransactionDetailModel _transactionDetailModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionDetailModel();
  object.firestoreId = reader.readString(offsets[0]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[1]);
  object.menuFirestoreId = reader.readString(offsets[2]);
  object.menuName = reader.readString(offsets[3]);
  object.menuPrice = reader.readDouble(offsets[4]);
  object.quantity = reader.readLong(offsets[5]);
  object.transactionFirestoreId = reader.readString(offsets[6]);
  return object;
}

P _transactionDetailModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _transactionDetailModelGetId(TransactionDetailModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _transactionDetailModelGetLinks(
    TransactionDetailModel object) {
  return [object.transaction];
}

void _transactionDetailModelAttach(
    IsarCollection<dynamic> col, Id id, TransactionDetailModel object) {
  object.id = id;
  object.transaction
      .attach(col, col.isar.collection<TransactionModel>(), r'transaction', id);
}

extension TransactionDetailModelByIndex
    on IsarCollection<TransactionDetailModel> {
  Future<TransactionDetailModel?> getByFirestoreId(String firestoreId) {
    return getByIndex(r'firestoreId', [firestoreId]);
  }

  TransactionDetailModel? getByFirestoreIdSync(String firestoreId) {
    return getByIndexSync(r'firestoreId', [firestoreId]);
  }

  Future<bool> deleteByFirestoreId(String firestoreId) {
    return deleteByIndex(r'firestoreId', [firestoreId]);
  }

  bool deleteByFirestoreIdSync(String firestoreId) {
    return deleteByIndexSync(r'firestoreId', [firestoreId]);
  }

  Future<List<TransactionDetailModel?>> getAllByFirestoreId(
      List<String> firestoreIdValues) {
    final values = firestoreIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'firestoreId', values);
  }

  List<TransactionDetailModel?> getAllByFirestoreIdSync(
      List<String> firestoreIdValues) {
    final values = firestoreIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'firestoreId', values);
  }

  Future<int> deleteAllByFirestoreId(List<String> firestoreIdValues) {
    final values = firestoreIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'firestoreId', values);
  }

  int deleteAllByFirestoreIdSync(List<String> firestoreIdValues) {
    final values = firestoreIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'firestoreId', values);
  }

  Future<Id> putByFirestoreId(TransactionDetailModel object) {
    return putByIndex(r'firestoreId', object);
  }

  Id putByFirestoreIdSync(TransactionDetailModel object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'firestoreId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFirestoreId(List<TransactionDetailModel> objects) {
    return putAllByIndex(r'firestoreId', objects);
  }

  List<Id> putAllByFirestoreIdSync(List<TransactionDetailModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'firestoreId', objects, saveLinks: saveLinks);
  }
}

extension TransactionDetailModelQueryWhereSort
    on QueryBuilder<TransactionDetailModel, TransactionDetailModel, QWhere> {
  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TransactionDetailModelQueryWhere on QueryBuilder<
    TransactionDetailModel, TransactionDetailModel, QWhereClause> {
  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterWhereClause> firestoreIdEqualTo(String firestoreId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'firestoreId',
        value: [firestoreId],
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterWhereClause> firestoreIdNotEqualTo(String firestoreId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firestoreId',
              lower: [],
              upper: [firestoreId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firestoreId',
              lower: [firestoreId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firestoreId',
              lower: [firestoreId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firestoreId',
              lower: [],
              upper: [firestoreId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TransactionDetailModelQueryFilter on QueryBuilder<
    TransactionDetailModel, TransactionDetailModel, QFilterCondition> {
  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> firestoreIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> firestoreIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> firestoreIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> firestoreIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firestoreId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> firestoreIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> firestoreIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
          QAfterFilterCondition>
      firestoreIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
          QAfterFilterCondition>
      firestoreIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firestoreId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> firestoreIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firestoreId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> firestoreIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firestoreId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuFirestoreIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'menuFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuFirestoreIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'menuFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuFirestoreIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'menuFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuFirestoreIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'menuFirestoreId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuFirestoreIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'menuFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuFirestoreIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'menuFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
          QAfterFilterCondition>
      menuFirestoreIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'menuFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
          QAfterFilterCondition>
      menuFirestoreIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'menuFirestoreId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuFirestoreIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'menuFirestoreId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuFirestoreIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'menuFirestoreId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'menuName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'menuName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'menuName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'menuName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'menuName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'menuName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
          QAfterFilterCondition>
      menuNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'menuName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
          QAfterFilterCondition>
      menuNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'menuName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'menuName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'menuName',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'menuPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'menuPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'menuPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> menuPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'menuPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> quantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> quantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> transactionFirestoreIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> transactionFirestoreIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> transactionFirestoreIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> transactionFirestoreIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionFirestoreId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> transactionFirestoreIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> transactionFirestoreIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
          QAfterFilterCondition>
      transactionFirestoreIdContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionFirestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
          QAfterFilterCondition>
      transactionFirestoreIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionFirestoreId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> transactionFirestoreIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionFirestoreId',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> transactionFirestoreIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionFirestoreId',
        value: '',
      ));
    });
  }
}

extension TransactionDetailModelQueryObject on QueryBuilder<
    TransactionDetailModel, TransactionDetailModel, QFilterCondition> {}

extension TransactionDetailModelQueryLinks on QueryBuilder<
    TransactionDetailModel, TransactionDetailModel, QFilterCondition> {
  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> transaction(FilterQuery<TransactionModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'transaction');
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel,
      QAfterFilterCondition> transactionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transaction', 0, true, 0, true);
    });
  }
}

extension TransactionDetailModelQuerySortBy
    on QueryBuilder<TransactionDetailModel, TransactionDetailModel, QSortBy> {
  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByFirestoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firestoreId', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByFirestoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firestoreId', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByMenuFirestoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuFirestoreId', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByMenuFirestoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuFirestoreId', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByMenuName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuName', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByMenuNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuName', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByMenuPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuPrice', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByMenuPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuPrice', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByTransactionFirestoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionFirestoreId', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      sortByTransactionFirestoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionFirestoreId', Sort.desc);
    });
  }
}

extension TransactionDetailModelQuerySortThenBy on QueryBuilder<
    TransactionDetailModel, TransactionDetailModel, QSortThenBy> {
  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByFirestoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firestoreId', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByFirestoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firestoreId', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByMenuFirestoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuFirestoreId', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByMenuFirestoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuFirestoreId', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByMenuName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuName', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByMenuNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuName', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByMenuPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuPrice', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByMenuPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'menuPrice', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByTransactionFirestoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionFirestoreId', Sort.asc);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QAfterSortBy>
      thenByTransactionFirestoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionFirestoreId', Sort.desc);
    });
  }
}

extension TransactionDetailModelQueryWhereDistinct
    on QueryBuilder<TransactionDetailModel, TransactionDetailModel, QDistinct> {
  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QDistinct>
      distinctByFirestoreId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firestoreId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QDistinct>
      distinctByMenuFirestoreId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'menuFirestoreId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QDistinct>
      distinctByMenuName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'menuName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QDistinct>
      distinctByMenuPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'menuPrice');
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<TransactionDetailModel, TransactionDetailModel, QDistinct>
      distinctByTransactionFirestoreId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionFirestoreId',
          caseSensitive: caseSensitive);
    });
  }
}

extension TransactionDetailModelQueryProperty on QueryBuilder<
    TransactionDetailModel, TransactionDetailModel, QQueryProperty> {
  QueryBuilder<TransactionDetailModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TransactionDetailModel, String, QQueryOperations>
      firestoreIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firestoreId');
    });
  }

  QueryBuilder<TransactionDetailModel, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<TransactionDetailModel, String, QQueryOperations>
      menuFirestoreIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'menuFirestoreId');
    });
  }

  QueryBuilder<TransactionDetailModel, String, QQueryOperations>
      menuNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'menuName');
    });
  }

  QueryBuilder<TransactionDetailModel, double, QQueryOperations>
      menuPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'menuPrice');
    });
  }

  QueryBuilder<TransactionDetailModel, int, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<TransactionDetailModel, String, QQueryOperations>
      transactionFirestoreIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionFirestoreId');
    });
  }
}
