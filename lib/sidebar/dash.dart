import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'side_navbar.dart';


// Main Dashboard Page
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contributionPercentage = 65; // Example: 65% of meals covered
    final totalDonations = 34;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.green[700],
      ),
      drawer: SideNav(), // Use your custom drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Welcome & Intro
            Text(
              "Welcome back, Ahamadi 👋",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Your contributions are making a real impact.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),

            // Pie Chart: Contribution % in State
            Text(
              "Impact in Lagos State",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 180, child: _buildPieChart(contributionPercentage)),

            SizedBox(height: 20),

            // Achievement Stars
            _buildAchievementSection(totalDonations),

            SizedBox(height: 20),

            // Bar Chart: Total People Helped
            Text(
              "Total People Helped by Region",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 250, child: _buildImpactBarChart()),

            SizedBox(height: 20),

            // Call to Action
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
                      // TODO: Navigate to donation form
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

  // Pie Chart Widget
  Widget _buildPieChart(int contributionPercentage) {
    final data = [
      PieSegment('Helped', contributionPercentage, Colors.green),
      PieSegment('Remaining', 100 - contributionPercentage, Colors.grey[300]!),
    ];

    final series = [
      charts.Series<PieSegment, String>(
        id: 'Contributions',
        domainFn: (PieSegment seg, _) => seg.label,
        measureFn: (PieSegment seg, _) => seg.value,
        colorFn: (PieSegment seg, _) =>
            charts.ColorUtil.fromDartColor(seg.color),
        data: data,
        labelAccessorFn: (PieSegment seg, _) => '${seg.label}: ${seg.value}%',
      )
    ];

    return charts.PieChart<String>(
      series,
      animate: true,
      defaultRenderer: charts.ArcRendererConfig(
        arcWidth: 60,
        arcRendererDecorators: [
          charts.ArcLabelDecorator(),
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

  // Bar Chart for Overall Impact
  Widget _buildImpactBarChart() {
    final data = [
      ImpactData("Lagos", 1200, Colors.green),
      ImpactData("Abuja", 850, Colors.blue),
      ImpactData("Kano", 650, Colors.orange),
      ImpactData("Enugu", 400, Colors.purple),
      ImpactData("Kaduna", 300, Colors.teal),
    ];

    final series = [
      charts.Series<ImpactData, String>(
        id: "Impact",
        data: data,
        domainFn: (ImpactData region, _) => region.region,
        measureFn: (ImpactData region, _) => region.peopleHelped,
        colorFn: (ImpactData region, _) =>
            charts.ColorUtil.fromDartColor(region.color),
      )
    ];

    return charts.BarChart(
      series,
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }
}

// Pie Segment Data Model
class PieSegment {
  final String label;
  final int value;
  final Color color;

  PieSegment(this.label, this.value, this.color);
}

// Impact Data Model for Bar Chart
class ImpactData {
  final String region;
  final int peopleHelped;
  final Color color;

  ImpactData(this.region, this.peopleHelped, this.color);
}
