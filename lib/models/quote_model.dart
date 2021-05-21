import 'package:flutter_simple_mvvm_architecture/core/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote_model.g.dart';

@JsonSerializable()
class BaseQuoteModel {
  String? text;
  String? tag;
  String? author;

  BaseQuoteModel({this.text, this.author, this.tag});

  factory BaseQuoteModel.fromJson(Map<String, dynamic> json) =>
      _$BaseQuoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseQuoteModelToJson(this);
}

@JsonSerializable()
class QuoteModel extends BaseModel {
  List<BaseQuoteModel>? quotes;

  QuoteModel({this.quotes});

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$QuoteModelToJson(this);
  }
}
