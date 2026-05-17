# DevNexus AI: Smart University App 🎓

[cite_start]The Smart University App is a full-stack mobile application developed using Flutter, Node.js, and MySQL to digitally manage university-related services[cite: 12]. [cite_start]It provides a centralized digital platform for university students[cite: 17]. 

## ✨ Features

* [cite_start]**📊 Attendance Tracking:** Allows students to view attendance records and track percentages[cite: 18].
* [cite_start]**📅 Timetable Management:** Displays the class timetable and upcoming schedules[cite: 19].
* [cite_start]**✏️ Assignment Dashboard:** Shows assignments along with their due dates and current status[cite: 20].
* [cite_start]**🎉 Campus Events:** Provides updates on university events and important announcements[cite: 21].
* [cite_start]**🍽️ Cafeteria Menu & Ordering:** Includes a cafeteria module for viewing menu items and placing orders[cite: 22].
* [cite_start]**🤖 AI Chatbot:** Features an AI chatbot designed to answer software-development-related questions[cite: 23].
* [cite_start]**📚 Learning Resources:** Supports images, GIFs, and downloadable PDF or Word learning resources[cite: 24].

## 🛠️ Technology Stack

* [cite_start]**Frontend:** Developed using Flutter[cite: 16].
* [cite_start]**Backend:** Developed using Node.js[cite: 16].
* [cite_start]**Database:** Developed using MySQL[cite: 16].
* [cite_start]**API:** Uses REST APIs to connect the Flutter app with the backend and database[cite: 25].

---

## 📸 App Screenshots

Below is a visual overview of the application and the backend environment:

### Backend & Database Environment
* [cite_start]**Mysql database Xampp:** [cite: 26]
  ![Mysql database Xampp](assets/screenshots/mysql_xampp.png)
* [cite_start]**Node js server running:** [cite: 27]
  ![Node js server running](assets/screenshots/node_server.png)

### Flutter Application Interfaces
* [cite_start]**Welcome screen:** [cite: 28]
  ![Welcome screen](assets/screenshots/welcome_screen.png)
* [cite_start]**Complete dashboard:** [cite: 29]
  ![Complete dashboard](assets/screenshots/dashboard.png)
* [cite_start]**Announcements:** [cite: 30]
  ![Announcements](assets/screenshots/announcements.png)
* [cite_start]**Assignments:** [cite: 31]
  ![Assignments](assets/screenshots/assignments.png)
* [cite_start]**Attendance:** [cite: 32]
  ![Attendance](assets/screenshots/attendance.png)
* [cite_start]**Cafetaria:** [cite: 33]
  ![Cafetaria](assets/screenshots/cafeteria.png)
* [cite_start]**Events:** [cite: 34]
  ![Events](assets/screenshots/events.png)
* [cite_start]**Timetable:** [cite: 35]
  ![Timetable](assets/screenshots/timetable.png)
* [cite_start]**AI Chat-bot:** [cite: 36]
  ![AI Chat-bot](assets/screenshots/ai_chatbot_1.png)
  ![AI Chat-bot](assets/screenshots/ai_chatbot_2.png)

---

## 🚀 Getting Started

Follow these steps to run the application on your local machine.

### 1. Database Setup
1. Start **Apache** and **MySQL** from your XAMPP Control Panel.
2. Open phpMyAdmin (`http://localhost/phpmyadmin`).
3. Import the `backend/setup.sql` file to create the database and populate it with sample data.

### 2. Backend Setup
Open a terminal and navigate to the backend directory to start the server:
```bash
cd backend
npm install
npm run dev
(The API will be running on http://localhost:3000)

3. Frontend Setup
Open a new terminal and run the Flutter app:

Bash
cd frontend
flutter pub get
flutter run -d chrome
👨‍💻 Author
Ahmed Hassan (@Ahmed-hs-2005)
