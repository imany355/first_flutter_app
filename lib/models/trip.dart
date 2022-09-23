class TripModel {
  final String title;
  final String time;
  final String no;

  TripModel({
    required this.title,
    required this.time,
    required this.no,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'time': time,
      'no': no,
    };
  }

  factory TripModel.fromJson(Map data) {
    return TripModel(
      title: data['title'],
      time: data['time'],
      no: data['no'],
    );
  }
}
