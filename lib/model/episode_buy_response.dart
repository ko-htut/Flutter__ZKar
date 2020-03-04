// To parse this JSON data, do
//
//     final eBresponse = eBresponseFromJson(jsonString);

import 'dart:convert';

EBresponse eBresponseFromJson(String str) => EBresponse.fromJson(json.decode(str));

String eBresponseToJson(EBresponse data) => json.encode(data.toJson());

class EBresponse {
    bool status;

    EBresponse({
        this.status,
    });

    factory EBresponse.fromJson(Map<String, dynamic> json) => EBresponse(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
