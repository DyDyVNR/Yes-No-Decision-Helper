// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'dart:convert';

YesNoModel yesNoModelFromJson(String str) => YesNoModel.fromJson(json.decode(str));

String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
    YesNoModel({
        this.answer ="unknown",
        this.forced = false,
        this.image = "no image",
    });

    String answer;
    bool forced;
    String image;

    factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"] == null ? null : json["answer"],
        forced: json["forced"] == null ? null : json["forced"],
        image: json["image"] == null ? null : json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer == null ? null : answer,
        "forced": forced == null ? null : forced,
        "image": image == null ? null : image,
    };
}
