import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AnnouncementsFragment extends StatelessWidget {
  const AnnouncementsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getAnnouncements(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return const Center(
              child: CircularProgressIndicator());

        final data = snapshot.data!;

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, i) {
            final item = data[i];
            return ListTile(
              title: Text(item['course_title']),
              subtitle: Text(item['message']),
            );
          },
        );
      },
    );
  }
}