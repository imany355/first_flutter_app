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

  @override
  operator ==(Object other) {
    if (other is TripModel && other.no == no) {
      return true;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => no.hashCode;
}
