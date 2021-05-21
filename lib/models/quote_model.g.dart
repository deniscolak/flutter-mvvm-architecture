// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseQuoteModel _$BaseQuoteModelFromJson(Map<String, dynamic> json) {
  return BaseQuoteModel(
    text: json['text'] as String?,
    author: json['author'] as String?,
    tag: json['tag'] as String?,
  );
}

Map<String, dynamic> _$BaseQuoteModelToJson(BaseQuoteModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'tag': instance.tag,
      'author': instance.author,
    };

QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) {
  return QuoteModel(
    quotes: (json['quotes'] as List<dynamic>?)
        ?.map((e) => BaseQuoteModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..status = json['status'] as int?
    ..message = json['message'] as String?
    ..count = json['count'] as int?;
}

Map<String, dynamic> _$QuoteModelToJson(QuoteModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'count': instance.count,
      'quotes': instance.quotes,
    };
