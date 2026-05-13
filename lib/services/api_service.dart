import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  // Change this to your actual backend URL
  static const String baseUrl = 'http://localhost:3000/api';
  static const int studentId = 1; // Default student ID for testing

  // ============================================
  // STUDENT ENDPOINTS
  // ============================================
  static Future<Map<String, dynamic>> getStudentInfo() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/../api/student/$studentId'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      return {'error': 'Failed to fetch student info'};
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // ============================================
  // ATTENDANCE ENDPOINTS
  // ============================================
  static Future<List<dynamic>> getAttendance() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/attendance/$studentId'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data is List ? data : [];
      }
      return [];
    } catch (e) {
      print('Attendance Error: $e');
      return _getMockAttendance();
    }
  }

  // ============================================
  // TIMETABLE ENDPOINTS
  // ============================================
  static Future<List<dynamic>> getTimetable() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/timetable/$studentId'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data is List ? data : [];
      }
      return [];
    } catch (e) {
      print('Timetable Error: $e');
      return _getMockTimetable();
    }
  }

  // ============================================
  // ASSIGNMENTS ENDPOINTS
  // ============================================
  static Future<List<dynamic>> getAssignments() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/assignments/$studentId'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data is List ? data : [];
      }
      return [];
    } catch (e) {
      print('Assignments Error: $e');
      return _getMockAssignments();
    }
  }

  // ============================================
  // EVENTS ENDPOINTS
  // ============================================
  static Future<List<dynamic>> getEvents() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/events'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data is List ? data : [];
      }
      return [];
    } catch (e) {
      print('Events Error: $e');
      return _getMockEvents();
    }
  }

  // ============================================
  // CAFETERIA ENDPOINTS
  // ============================================
  static Future<List<dynamic>> getCafeteriaMenu() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/cafeteria/menu'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data is List ? data : [];
      }
      return [];
    } catch (e) {
      print('Cafeteria Menu Error: $e');
      return _getMockCafeteriaMenu();
    }
  }

  static Future<Map<String, dynamic>> placeOrder(
    String itemName,
    int quantity,
    double totalPrice,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/cafeteria/order'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'student_id': studentId,
          'item_name': itemName,
          'quantity': quantity,
          'total_price': totalPrice,
        }),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 201) {
        return json.decode(response.body);
      }
      return {'error': 'Failed to place order'};
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // ============================================
  // ANNOUNCEMENTS ENDPOINTS
  // ============================================
  static Future<List<dynamic>> getAnnouncements() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/announcements/$studentId'),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data is List ? data : [];
      }
      return [];
    } catch (e) {
      print('Announcements Error: $e');
      return _getMockAnnouncements();
    }
  }

  // ============================================
  // CHATBOT ENDPOINTS
  // ============================================
  static Future<Map<String, dynamic>> askChatbot(String question) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/chatbot/ask'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'question': question}),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      return {'answer': 'I could not process your question. Please try again.'};
    } catch (e) {
      return {
        'answer':
            'Sorry, I\'m unable to connect to the server. Please check your connection.'
      };
    }
  }

  // ============================================
  // MOCK DATA (Fallback)
  // ============================================
  static List<dynamic> _getMockAttendance() {
    return [
      {
        'id': 1,
        'course_title': 'Mobile App Development',
        'course_code': 'MAD-401',
        'total_classes': 30,
        'attended_classes': 25,
        'percentage': 83.33
      },
      {
        'id': 2,
        'course_title': 'Database Management',
        'course_code': 'DBM-401',
        'total_classes': 28,
        'attended_classes': 22,
        'percentage': 78.57
      }
    ];
  }

  static List<dynamic> _getMockTimetable() {
    return [
      {
        'id': 1,
        'day_name': 'Monday',
        'course_title': 'Mobile App Development',
        'start_time': '09:00 AM',
        'end_time': '10:30 AM',
        'room_no': 'Lab-2',
        'teacher_name': 'Sir Ahmed'
      },
      {
        'id': 2,
        'day_name': 'Tuesday',
        'course_title': 'Database Management',
        'start_time': '11:00 AM',
        'end_time': '12:30 PM',
        'room_no': 'Room-101',
        'teacher_name': 'Dr. Fatima'
      }
    ];
  }

  static List<dynamic> _getMockAssignments() {
    return [
      {
        'id': 1,
        'title': 'Flutter Fragments Lab',
        'course_title': 'Mobile App Development',
        'description': 'Create university app fragments',
        'due_date': '2026-05-14',
        'status': 'Pending'
      },
      {
        'id': 2,
        'title': 'SQL Queries Project',
        'course_title': 'Database Management',
        'description': 'Write complex SQL queries',
        'due_date': '2026-05-20',
        'status': 'Submitted'
      }
    ];
  }

  static List<dynamic> _getMockEvents() {
    return [
      {
        'id': 1,
        'title': 'AI in Software Development Seminar',
        'description': 'A seminar about AI tools for developers',
        'event_date': '2026-05-16',
        'venue': 'Main Auditorium'
      },
      {
        'id': 2,
        'title': 'Flutter Workshop',
        'description': 'Learn advanced Flutter concepts',
        'event_date': '2026-05-18',
        'venue': 'Lab Building'
      }
    ];
  }

  static List<dynamic> _getMockCafeteriaMenu() {
    return [
      {'id': 1, 'item_name': 'Chicken Burger', 'category': 'Fast Food', 'price': 450},
      {'id': 2, 'item_name': 'Tea', 'category': 'Drinks', 'price': 80},
      {'id': 3, 'item_name': 'Sandwich', 'category': 'Fast Food', 'price': 250},
      {'id': 4, 'item_name': 'Coffee', 'category': 'Drinks', 'price': 150},
      {'id': 5, 'item_name': 'Pizza', 'category': 'Fast Food', 'price': 600}
    ];
  }

  static List<dynamic> _getMockAnnouncements() {
    return [
      {
        'id': 1,
        'teacher_name': 'Sir Ahmed',
        'course_title': 'Mobile App Development',
        'message': 'Submit Flutter fragments lab by Thursday.',
        'created_at': DateTime.now().subtract(Duration(hours: 2)).toIso8601String()
      },
      {
        'id': 2,
        'teacher_name': 'Dr. Fatima',
        'course_title': 'Database Management',
        'message': 'Mid-term exam will be held on next Monday.',
        'created_at': DateTime.now().subtract(Duration(hours: 5)).toIso8601String()
      }
    ];
  }
}
