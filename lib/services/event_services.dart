import '../model/event_model.dart';
import 'package:http/http.dart' as http;

class EventService {
  Future<List<Event>> getAll() async {
    const url =
        "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=US&apikey=fJaxE14X0bWaFZMnXW1A3GGDAHUttspN";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    List<Event> event = [];
    if (response.statusCode == 200) {
      // final json = jsonDecode(response.body);
      final decodedevent = eventgetFromJson(response.body);
      event = decodedevent.embedded.events;
      // final json = "[" + response.body + "]" as List;
      print(event);
      // final events = json.map((e) {
      //   return Event(
      //       id: e["id"],
      //       title: e["title"],
      //       userId: e["userId"],
      //       completed: e["completed"]);
      // }).toList();
      // return events;
    }
    return event;
    // throw "Something went worng";
  }
}
