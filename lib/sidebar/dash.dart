import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


// Main Dashboard Page
class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contributionPercentage = 65; // Example: 65% of meals covered
    final totalDonations = 34;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.green[700],
      ),
      // Use your custom drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Welcome back, Ahamadi 👋",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Your contributions are making a real impact.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Text(
              "Impact in Telangana",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
                height: 200, child: _buildPieChart(contributionPercentage)),
            SizedBox(height: 20),
            _buildAchievementSection(totalDonations),
            SizedBox(height: 20),
            Text(
              "Total People Helped by Region",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 250, child: _buildImpactBarChart()),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ready to make another difference?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Donate your leftover food to help someone in need.",
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    label: Text("Donate Now"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/upload');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Pie Chart with fl_chart
  Widget _buildPieChart(int contributionPercentage) {
    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 40,
        sections: [
          PieChartSectionData(
            color: Colors.green,
            value: contributionPercentage.toDouble(),
            title: '$contributionPercentage%',
            radius: 60,
            titleStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            color: Colors.grey[300],
            value: (100 - contributionPercentage).toDouble(),
            title: '${100 - contributionPercentage}%',
            radius: 60,
            titleStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  // Achievement Badge Section
  Widget _buildAchievementSection(int totalDonations) {
    String level;
    IconData icon;
    Color color;

    if (totalDonations >= 50) {
      level = "Gold Contributor";
      icon = Icons.star;
      color = Colors.amber[700]!;
    } else if (totalDonations >= 20) {
      level = "Silver Contributor";
      icon = Icons.star_half;
      color = Colors.grey;
    } else {
      level = "Bronze Contributor";
      icon = Icons.star_border;
      color = Colors.brown;
    }

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 36),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                level,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text("$totalDonations total donations"),
            ],
          ),
        ],
      ),
    );
  }

  // Bar Chart using fl_chart
  Widget _buildImpactBarChart() {
    final data = [
      ImpactData("Hyderabad", 1200, Colors.green),
      ImpactData("Karimnagar", 850, Colors.blue),
      ImpactData("Siddipet", 650, Colors.orange),
      ImpactData("Warangal", 400, Colors.purple),
      ImpactData("Vikarabad", 300, Colors.teal),
    ];

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 1400,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, interval: 200),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) {
                final index = value.toInt();
                if (index >= 0 && index < data.length) {
                  return Text(data[index].region);
                }
                return SizedBox.shrink();
              },
              reservedSize: 40,
            ),
          ),
        ),
        barGroups: List.generate(data.length, (index) {
          final entry = data[index];
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: entry.peopleHelped.toDouble(),
                color: entry.color,
                width: 20,
              ),
            ],
          );
        }),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: true),
      ),
    );
  }
}

// Data Model for Bar Chart
class ImpactData {
  final String region;
  final int peopleHelped;
  final Color color;

  ImpactData(this.region, this.peopleHelped, this.color);
}
