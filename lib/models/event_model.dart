class EventModel {
  final String eventTitle;
  final String eventId;
  final String eventStartDate;
  final String eventEndDate;
  final String eventDescription;

  EventModel({
    required this.eventDescription,
    required this.eventEndDate,
    required this.eventId,
    required this.eventStartDate,
    required this.eventTitle,
  });
}
