# Smart University App 🎓

The Smart University App is a full-stack mobile application developed using Flutter, Node.js, and MySQL to digitally manage university-related services. It provides a centralized digital platform for university students. 

## ✨ Features

* **📊 Attendance Tracking:** Allows students to view attendance records and track percentages.
* **📅 Timetable Management:** Displays the class timetable and upcoming schedules.
* **✏️ Assignment Dashboard:** Shows assignments along with their due dates and current status.
* **🎉 Campus Events:** Provides updates on university events and important announcements.
* **🍽️ Cafeteria Menu & Ordering:** Includes a cafeteria module for viewing menu items and placing orders.
* **🤖 AI Chatbot:** Features an AI chatbot designed to answer software-development-related questions.
* **📚 Learning Resources:** Supports images, GIFs, and downloadable PDF or Word learning resources.

## 🛠️ Technology Stack

* **Frontend:** Developed using Flutter.
* **Backend:** Developed using Node.js.
* **Database:** Developed using MySQL.
* **API:** Uses REST APIs to connect the Flutter app with the backend and database.

---

## 📸 App Screenshots

Below is a visual overview of the application and the backend environment:

### Backend & Database Environment
* **Mysql database Xampp:**
  ![Mysql database Xampp](assets/screenshots/mysql_xampp.png)
* **Node js server running:**
  ![Node js server running](assets/screenshots/node_server.png)

### Flutter Application Interfaces
* **Welcome screen:**
  ![Welcome screen](assets/screenshots/welcome_screen.png)
* **Complete dashboard:**
  ![Complete dashboard](assets/screenshots/dashboard.png)
* **Announcements:**
  ![Announcements](assets/screenshots/announcements.png)
* **Assignments:**
  ![Assignments](assets/screenshots/assignments.png)
* **Attendance:**
  ![Attendance](assets/screenshots/attendance.png)
* **Cafetaria:**
  ![Cafetaria](assets/screenshots/cafeteria.png)
* **Events:**
  ![Events](assets/screenshots/events.png)
* **Timetable:**
  ![Timetable](assets/screenshots/timetable.png)
* **AI Chat-bot:**
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
