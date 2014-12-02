library EchoResponse;

class  EchoResponse{
  String dateTime;
  String random;

  EchoResponse(this.dateTime, this.random);

  Map<String, dynamic> toJson() => <String, dynamic>{
    "dateTime": dateTime,
    "random": random
  };

  EchoResponse.fromJson(Map<String, dynamic> json): this(json['dateTime'], json['random']);
}