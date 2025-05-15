import 'package:flutter/material.dart';

void main() {
  runApp(ShareAMealApp());
}

class ShareAMealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share A Meal',
      theme: ThemeData(primarySwatch: Colors.green),
      home: DonatePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  String _selectedNGO = 'Wahheed-ul-Uloom';
  String _selectedPaymentMethod = 'Visa'; // Default selected

  final List<String> ngos = [
    'Wahheed-ul-Uloom',
    'St. Joseph\'s NGO',
    'Helping Hands Foundation',
  ];

  final Map<String, String> paymentMethods = {
    'Visa': 'assets/visa.png',
    'Mastercard': 'assets/mastercard.png',
    'UPI': 'assets/upi.png',
    'Amazon Pay': 'assets/amazonpay.png',
  };

  void _payNow() {
    final amount = _amountController.text;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Donating ₹$amount to $_selectedNGO via $_selectedPaymentMethod')),
    );
  }

  bool get _showCardFields => _selectedPaymentMethod == paymentMethods.keys.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate Now'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Every donation you make is helping someone out there ❤️',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),

            // Amount and NGO
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter Amount (₹)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedNGO,
                    items: ngos
                        .map((ngo) => DropdownMenuItem(
                              value: ngo,
                              child: Text(ngo),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedNGO = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Select NGO',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // Payment method selection
            Text('Choose Payment Method:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: paymentMethods.entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPaymentMethod = entry.key;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedPaymentMethod == entry.key ? Colors.green : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      entry.value,
                      width: 50,
                      height: 40,
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 30),

            // Card fields shown only if the first payment option (Visa) is selected
            if (_showCardFields) ...[
              TextField(
                controller: _cardHolderController,
                decoration: InputDecoration(
                  labelText: 'Card Holder Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 100,
                  child: TextField(
                    controller: _cvvController,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      hintText: 'XXX',
                      border: OutlineInputBorder(),
                      counterText: '', // hides character count
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],

            Center(
              child: ElevatedButton(
                onPressed: _payNow,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text('Pay Now', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
