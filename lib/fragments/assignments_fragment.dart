import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AssignmentsFragment extends StatelessWidget {
  const AssignmentsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getAssignments(),
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
              title: Text(item['title']),
              subtitle: Text(item['due_date']),
            );
          },
        );
      },
    );
  }
}