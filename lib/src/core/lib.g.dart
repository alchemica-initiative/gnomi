// GENERATED CODE - DO NOT MODIFY BY HAND

part of dev.alchemica.gnomi.core;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String?,
      sender: const WalletRawConverter().fromJson(json['sender'] as String),
      receiver: const WalletRawConverter().fromJson(json['receiver'] as String),
      signature:
          const ByteListRawConverter().fromJson(json['signature'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      fee: (json['fee'] as num?)?.toDouble() ?? 1,
      data: json['data'],
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender': const WalletRawConverter().toJson(instance.sender),
      'receiver': const WalletRawConverter().toJson(instance.receiver),
      'amount': instance.amount,
      'fee': instance.fee,
      'data': instance.data,
      'signature': const ByteListRawConverter().toJson(instance.signature),
    };

BlockConfirmation _$BlockConfirmationFromJson(Map<String, dynamic> json) =>
    BlockConfirmation(
      confirmer:
          const WalletRawConverter().fromJson(json['confirmer'] as String),
      signature:
          const ByteListRawConverter().fromJson(json['signature'] as String),
    );

Map<String, dynamic> _$BlockConfirmationToJson(BlockConfirmation instance) =>
    <String, dynamic>{
      'confirmer': const WalletRawConverter().toJson(instance.confirmer),
      'signature': const ByteListRawConverter().toJson(instance.signature),
    };

Block _$BlockFromJson(Map<String, dynamic> json) => Block(
      id: json['id'] as String,
      parentId: json['parentId'] as String,
      included: (json['included'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      confirmations: (json['confirmations'] as List<dynamic>)
          .map((e) => BlockConfirmation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlockToJson(Block instance) => <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'included': instance.included,
      'confirmations': instance.confirmations,
    };
