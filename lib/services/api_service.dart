import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "http://localhost:3000"; // for flutter web

  static Future<List<dynamic>> getAttendance() async {
    final response =
    await http.get(Uri.parse('$baseUrl/api/attendance/1'));
    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> getTimetable() async {
    final response =
    await http.get(Uri.parse('$baseUrl/api/timetable/1'));
    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> getAssignments() async {
    final response =
    await http.get(Uri.parse('$baseUrl/api/assignments/1'));
    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> getEvents() async {
    final response =
    await http.get(Uri.parse('$baseUrl/api/events'));
    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> getCafeteriaMenu() async {
    final response =
    await http.get(Uri.parse('$baseUrl/api/cafeteria/menu'));
    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> getAnnouncements() async {
    final response =
    await http.get(Uri.parse('$baseUrl/api/announcements/1'));
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> askChatbot(
      String question) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/chatbot/ask'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'question': question}),
    );

    return jsonDecode(response.body);
  }
}