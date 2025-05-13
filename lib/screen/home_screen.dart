import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final bool isOnline = true;
  final String driverName = "Budi Santoso";
  final double driverRating = 4.7;
  final int completedOrders = 128;

  final List<Map<String, dynamic>> biddingList = const [
    {
      "id": 1,
      "customer": "Andi",
      "price": 8000,
      "pickup": "Gedung A",
      "dropoff": "Perpus UNEJ",
      "eta": "2 menit",
    },
    {
      "id": 2,
      "customer": "Dina",
      "price": 9500,
      "pickup": "FKIP",
      "dropoff": "Masjid Kampus",
      "eta": "4 menit",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JetDriver'),
        actions: [
          Row(
            children: [
              Text(isOnline ? "Online" : "Offline"),
              const SizedBox(width: 8),
              Icon(isOnline ? Icons.toggle_on : Icons.toggle_off, size: 32),
              const SizedBox(width: 12),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // MAP placeholder
          Container(
            height: 200,
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: const Text('Map View (Placeholder)'),
          ),

          // Driver info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(radius: 24, child: Icon(Icons.person)),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(driverName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber[600], size: 16),
                        const SizedBox(width: 4),
                        Text('$driverRating • $completedOrders order selesai'),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          const Divider(),

          // Status info
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue),
                SizedBox(width: 8),
                Text("Menunggu order masuk...",
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Bidding list
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: biddingList.isEmpty
                  ? const Center(child: Text('Belum ada penawaran masuk'))
                  : ListView.builder(
                      itemCount: biddingList.length,
                      itemBuilder: (context, index) {
                        final bid = biddingList[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            title: Text(
                                "🧍 ${bid['customer']} • Rp${bid['price']}"),
                            subtitle: Text(
                                "🚏 ${bid['pickup']} → ${bid['dropoff']}\n⏱️ Estimasi jemput: ${bid['eta']}"),
                            isThreeLine: true,
                            trailing: ElevatedButton(
                              onPressed: () {
                                // TODO: handle accept bidding
                              },
                              child: const Text("Pilih"),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }
}
