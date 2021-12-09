// To parse this JSON data, do
//
//     final paymentIntentResponse = paymentIntentResponseFromJson(jsonString);

import 'dart:convert';

PaymentIntentResponse paymentIntentResponseFromJson(String str) =>
    PaymentIntentResponse.fromJson(json.decode(str));

String paymentIntentResponseToJson(PaymentIntentResponse data) =>
    json.encode(data.toJson());

class PaymentIntentResponse {
  PaymentIntentResponse({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.charges,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.livemode,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final int amountReceived;
  final dynamic application;
  final dynamic applicationFeeAmount;
  final dynamic canceledAt;
  final dynamic cancellationReason;
  final String captureMethod;
  final Charges charges;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final dynamic customer;
  final dynamic description;
  final dynamic invoice;
  final dynamic lastPaymentError;
  final bool livemode;
  final Metadata metadata;
  final dynamic nextAction;
  final dynamic onBehalfOf;
  final dynamic paymentMethod;
  final PaymentMethodOptions paymentMethodOptions;
  final List<String> paymentMethodTypes;
  final dynamic receiptEmail;
  final dynamic review;
  final dynamic setupFutureUsage;
  final dynamic shipping;
  final dynamic source;
  final dynamic statementDescriptor;
  final dynamic statementDescriptorSuffix;
  final String status;
  final dynamic transferData;
  final dynamic transferGroup;

  factory PaymentIntentResponse.fromJson(Map<String, dynamic> json) {
    var paymentIntentResponse = PaymentIntentResponse(
      id: json['id'],
      object: json['object'],
      amount: json['amount'],
      amountCapturable: json['amount_capturable'],
      amountReceived: json['amount_received'],
      application: json['application'],
      applicationFeeAmount: json['application_fee_amount'],
      canceledAt: json['canceled_at'],
      cancellationReason: json['cancellation_reason'],
      captureMethod: json['capture_method'],
      charges: Charges.fromJson(json['charges']),
      clientSecret: json['client_secret'],
      confirmationMethod: json['confirmation_method'],
      created: json['created'],
      currency: json['currency'],
      customer: json['customer'],
      description: json['description'],
      invoice: json['invoice'],
      lastPaymentError: json['last_payment_error'],
      livemode: json['livemode'],
      metadata: Metadata.fromJson(json['metadata']),
      nextAction: json['next_action'],
      onBehalfOf: json['on_behalf_of'],
      paymentMethod: json['payment_method'],
      paymentMethodOptions:
          PaymentMethodOptions.fromJson(json['payment_method_options']),
      paymentMethodTypes:
          List<String>.from(json['payment_method_types'].map((x) => x)),
      receiptEmail: json['receipt_email'],
      review: json['review'],
      setupFutureUsage: json['setup_future_usage'],
      shipping: json['shipping'],
      source: json['source'],
      statementDescriptor: json['statement_descriptor'],
      statementDescriptorSuffix: json['statement_descriptor_suffix'],
      status: json['status'],
      transferData: json['transfer_data'],
      transferGroup: json['transfer_group'],
    );
    return paymentIntentResponse;
  }

  Map<String, dynamic> toJson() {
    var map = {
      'id': id,
      'object': object,
      'amount': amount,
      'amount_capturable': amountCapturable,
      'amount_received': amountReceived,
      'application': application,
      'application_fee_amount': applicationFeeAmount,
      'canceled_at': canceledAt,
      'cancellation_reason': cancellationReason,
      'capture_method': captureMethod,
      'charges': charges.toJson(),
      'client_secret': clientSecret,
      'confirmation_method': confirmationMethod,
      'created': created,
      'currency': currency,
      'customer': customer,
      'description': description,
      'invoice': invoice,
      'last_payment_error': lastPaymentError,
      'livemode': livemode,
      'metadata': metadata.toJson(),
      'next_action': nextAction,
      'on_behalf_of': onBehalfOf,
      'payment_method': paymentMethod,
      'payment_method_options': paymentMethodOptions.toJson(),
      'payment_method_types':
          List<dynamic>.from(paymentMethodTypes.map((x) => x)),
      'receipt_email': receiptEmail,
      'review': review,
      'setup_future_usage': setupFutureUsage,
      'shipping': shipping,
      'source': source,
      'statement_descriptor': statementDescriptor,
      'statement_descriptor_suffix': statementDescriptorSuffix,
      'status': status,
      'transfer_data': transferData,
      'transfer_group': transferGroup,
    };
    return map;
  }
}

class Charges {
  Charges({
    this.object,
    this.data,
    this.hasMore,
    this.totalCount,
    this.url,
  });

  final String object;
  final List<dynamic> data;
  final bool hasMore;
  final int totalCount;
  final String url;

  factory Charges.fromJson(Map<String, dynamic> json) => Charges(
        object: json['object'],
        data: List<dynamic>.from(json['data'].map((x) => x)),
        hasMore: json['has_more'],
        totalCount: json['total_count'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'object': object,
        'data': List<dynamic>.from(data.map((x) => x)),
        'has_more': hasMore,
        'total_count': totalCount,
        'url': url,
      };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata();

  Map<String, dynamic> toJson() => {};
}

class PaymentMethodOptions {
  PaymentMethodOptions({
    this.card,
  });

  final Card card;

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) =>
      PaymentMethodOptions(
        card: Card.fromJson(json['card']),
      );

  Map<String, dynamic> toJson() => {
        'card': card.toJson(),
      };
}

class Card {
  Card({
    this.installments,
    this.network,
    this.requestThreeDSecure,
  });

  final dynamic installments;
  final dynamic network;
  final String requestThreeDSecure;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        installments: json['installments'],
        network: json['network'],
        requestThreeDSecure: json['request_three_d_secure'],
      );

  Map<String, dynamic> toJson() => {
        'installments': installments,
        'network': network,
        'request_three_d_secure': requestThreeDSecure,
      };
}
