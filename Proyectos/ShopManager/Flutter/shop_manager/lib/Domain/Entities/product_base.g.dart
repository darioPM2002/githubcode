// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_base.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductBaseCollection on Isar {
  IsarCollection<ProductBase> get productBases => this.collection();
}

const ProductBaseSchema = CollectionSchema(
  name: r'ProductBase',
  id: 7937148385732738729,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'originProduct': PropertySchema(
      id: 2,
      name: r'originProduct',
      type: IsarType.string,
    ),
    r'priceName': PropertySchema(
      id: 3,
      name: r'priceName',
      type: IsarType.stringList,
    ),
    r'prices': PropertySchema(
      id: 4,
      name: r'prices',
      type: IsarType.doubleList,
    ),
    r'typeProduct': PropertySchema(
      id: 5,
      name: r'typeProduct',
      type: IsarType.long,
    )
  },
  estimateSize: _productBaseEstimateSize,
  serialize: _productBaseSerialize,
  deserialize: _productBaseDeserialize,
  deserializeProp: _productBaseDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _productBaseGetId,
  getLinks: _productBaseGetLinks,
  attach: _productBaseAttach,
  version: '3.1.0+1',
);

int _productBaseEstimateSize(
  ProductBase object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.originProduct.length * 3;
  bytesCount += 3 + object.priceName.length * 3;
  {
    for (var i = 0; i < object.priceName.length; i++) {
      final value = object.priceName[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.prices.length * 8;
  return bytesCount;
}

void _productBaseSerialize(
  ProductBase object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.originProduct);
  writer.writeStringList(offsets[3], object.priceName);
  writer.writeDoubleList(offsets[4], object.prices);
  writer.writeLong(offsets[5], object.typeProduct);
}

ProductBase _productBaseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductBase(
    description: reader.readString(offsets[0]),
    isarId: id,
    name: reader.readString(offsets[1]),
    originProduct: reader.readString(offsets[2]),
    priceName: reader.readStringList(offsets[3]) ?? [],
    prices: reader.readDoubleList(offsets[4]) ?? [],
    typeProduct: reader.readLong(offsets[5]),
  );
  return object;
}

P _productBaseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productBaseGetId(ProductBase object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _productBaseGetLinks(ProductBase object) {
  return [];
}

void _productBaseAttach(
    IsarCollection<dynamic> col, Id id, ProductBase object) {}

extension ProductBaseQueryWhereSort
    on QueryBuilder<ProductBase, ProductBase, QWhere> {
  QueryBuilder<ProductBase, ProductBase, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductBaseQueryWhere
    on QueryBuilder<ProductBase, ProductBase, QWhereClause> {
  QueryBuilder<ProductBase, ProductBase, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProductBaseQueryFilter
    on QueryBuilder<ProductBase, ProductBase, QFilterCondition> {
  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> isarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      originProductEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originProduct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      originProductGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originProduct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      originProductLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originProduct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      originProductBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originProduct',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      originProductStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originProduct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      originProductEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originProduct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      originProductContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originProduct',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      originProductMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originProduct',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      originProductIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originProduct',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      originProductIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originProduct',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priceName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priceName',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priceName',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priceName',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priceName',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priceName',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      priceNameLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priceName',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      pricesElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prices',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      pricesElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prices',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      pricesElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prices',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      pricesElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prices',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      pricesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prices',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      pricesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prices',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      pricesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prices',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      pricesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prices',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      pricesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prices',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      pricesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'prices',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      typeProductEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeProduct',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      typeProductGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeProduct',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      typeProductLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeProduct',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterFilterCondition>
      typeProductBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeProduct',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProductBaseQueryObject
    on QueryBuilder<ProductBase, ProductBase, QFilterCondition> {}

extension ProductBaseQueryLinks
    on QueryBuilder<ProductBase, ProductBase, QFilterCondition> {}

extension ProductBaseQuerySortBy
    on QueryBuilder<ProductBase, ProductBase, QSortBy> {
  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> sortByOriginProduct() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originProduct', Sort.asc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy>
      sortByOriginProductDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originProduct', Sort.desc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> sortByTypeProduct() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeProduct', Sort.asc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> sortByTypeProductDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeProduct', Sort.desc);
    });
  }
}

extension ProductBaseQuerySortThenBy
    on QueryBuilder<ProductBase, ProductBase, QSortThenBy> {
  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> thenByOriginProduct() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originProduct', Sort.asc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy>
      thenByOriginProductDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originProduct', Sort.desc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> thenByTypeProduct() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeProduct', Sort.asc);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QAfterSortBy> thenByTypeProductDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeProduct', Sort.desc);
    });
  }
}

extension ProductBaseQueryWhereDistinct
    on QueryBuilder<ProductBase, ProductBase, QDistinct> {
  QueryBuilder<ProductBase, ProductBase, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QDistinct> distinctByOriginProduct(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originProduct',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductBase, ProductBase, QDistinct> distinctByPriceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceName');
    });
  }

  QueryBuilder<ProductBase, ProductBase, QDistinct> distinctByPrices() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prices');
    });
  }

  QueryBuilder<ProductBase, ProductBase, QDistinct> distinctByTypeProduct() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeProduct');
    });
  }
}

extension ProductBaseQueryProperty
    on QueryBuilder<ProductBase, ProductBase, QQueryProperty> {
  QueryBuilder<ProductBase, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ProductBase, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ProductBase, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ProductBase, String, QQueryOperations> originProductProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originProduct');
    });
  }

  QueryBuilder<ProductBase, List<String>, QQueryOperations>
      priceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceName');
    });
  }

  QueryBuilder<ProductBase, List<double>, QQueryOperations> pricesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prices');
    });
  }

  QueryBuilder<ProductBase, int, QQueryOperations> typeProductProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeProduct');
    });
  }
}
