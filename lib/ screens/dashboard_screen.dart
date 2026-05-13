import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'attendance_screen.dart';
import 'timetable_screen.dart';
import 'assignments_screen.dart';
import 'events_screen.dart';
import 'cafeteria_screen.dart';
import 'announcements_screen.dart';
import 'chatbot_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<MenuOption> menuOptions = [
    MenuOption(
      title: 'Attendance',
      icon: Icons.check_circle_outline,
      color: const Color(0xFF6366F1),
      screen: const AttendanceScreen(),
    ),
    MenuOption(
      title: 'Timetable',
      icon: Icons.schedule,
      color: const Color(0xFF3B82F6),
      screen: const TimetableScreen(),
    ),
    MenuOption(
      title: 'Assignments',
      icon: Icons.assignment,
      color: const Color(0xFF10B981),
      screen: const AssignmentsScreen(),
    ),
    MenuOption(
      title: 'Events',
      icon: Icons.event,
      color: const Color(0xFFEC4899),
      screen: const EventsScreen(),
    ),
    MenuOption(
      title: 'Cafeteria',
      icon: Icons.restaurant,
      color: const Color(0xFFF59E0B),
      screen: const CafeteriaScreen(),
    ),
    MenuOption(
      title: 'Announcements',
      icon: Icons.notifications,
      color: const Color(0xFF8B5CF6),
      screen: const AnnouncementsScreen(),
    ),
    MenuOption(
      title: 'AI Chatbot',
      icon: Icons.chat,
      color: const Color(0xFF14B8A6),
      screen: const ChatbotScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade50,
              Colors.indigo.shade50,
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Smart University'),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF6366F1),
                        const Color(0xFF3B82F6),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -50,
                        top: -50,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return MenuCard(
                      option: menuOptions[index],
                    );
                  },
                  childCount: menuOptions.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuOption {
  final String title;
  final IconData icon;
  final Color color;
  final Widget screen;

  MenuOption({
    required this.title,
    required this.icon,
    required this.color,
    required this.screen,
  });
}

class MenuCard extends StatefulWidget {
  final MenuOption option;

  const MenuCard({required this.option, Key? key}) : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) {
          return Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: action,
              child: AnimatedScale(
                scale: _isHovered ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        widget.option.color,
                        widget.option.color.withOpacity(0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: widget.option.color.withOpacity(0.3),
                        blurRadius: 15,
                        offset: Offset(0, _isHovered ? 10 : 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        widget.option.icon,
                        size: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.option.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        openBuilder: (context, action) {
          return widget.option.screen;
        },
      ),
    );
  }
}
