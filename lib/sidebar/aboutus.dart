import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // App description
          Text(
            '🌍 About Share A Meal',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Share A Meal is a socially driven platform created to help individuals make a meaningful impact through simple actions. '
            'Whether it\'s donating excess food or contributing money to a trusted cause, our app bridges the gap between donors and local NGOs '
            'that are actively working to fight hunger and support the underprivileged.\n\n'
            'We understand that people want to help but often don\'t know where or how. Our platform makes it simple — connect, choose, and share. '
            'Whether it\'s feeding the needy or empowering communities, every meal or rupee shared through this app goes toward making the world a kinder place.\n\n'
            'Our goal is to empower users to become active contributors to society and to ensure transparency by connecting them with verified NGOs '
            'that align with their values.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 30),

          // Developer section title
          Text(
            '👩‍💻 Meet the Developers',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          // Developer cards
          DeveloperCard(
            name: 'Mohammadi',
            year: '3rd Year CSE Student',
            college: 'Muffakham Jah College of Engineering and Technology',
            description:
                'Tech enthusiast and hackathon winner. Passionate about building tech for social good. Has led multiple projects in development and AI.',
          ),
          DeveloperCard(
            name: 'Haifa Nazeer',
            year: '2nd Year CSE Student',
            college: 'Muffakham Jah College of Engineering and Technology',
            description:
                'Keen interest in software development and UI design. Excited to explore real-world tech projects and contribute to impactful solutions.',
          ),
          DeveloperCard(
            name: 'Ahamadi Hareem',
            year: '2nd Year CSE Student',
            college: 'Muffakham Jah College of Engineering and Technology',
            description:
                'Developer with a growing interest in mobile app development. Eager to learn, collaborate, and innovate through real-world experiences.',
          ),

          SizedBox(height: 20),

          // Closing quote
          Text(
            '“We believe in using technology not just for convenience, but for compassion. '
            'Share A Meal is our small step towards a larger change.”',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  final String name;
  final String year;
  final String college;
  final String description;

  const DeveloperCard({
    Key? key,
    required this.name,
    required this.year,
    required this.college,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(year, style: TextStyle(color: Colors.grey[700])),
            Text(college, style: TextStyle(color: Colors.grey[700])),
            SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
