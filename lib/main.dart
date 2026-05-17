import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F1115),
        colorScheme: ColorScheme.dark(primary: Colors.cyanAccent),
      ),
      home: const GameConsolePage(),
    );
  }
}

class GameConsolePage extends StatefulWidget {
  const GameConsolePage({super.key});
  @override
  State<GameConsolePage> createState() => _GameConsolePageState();
}

class _GameConsolePageState extends State<GameConsolePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool aimAssist = true;
  bool rogMonitor = true;
  bool fpsOptimize = true;
  bool sensiOptimize = true;
  bool cacheMode = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("GAME", style: TextStyle(fontSize: 12, color: Colors.grey)),
                          Text("CONSOLE", 
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: const Text("Feature", style: TextStyle(color: Colors.cyanAccent)),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Banner FreeFire
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: NetworkImage("https://via.placeholder.com/400x200"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage("https://via.placeholder.com/80"),
                              radius: 24,
                            ),
                            const SizedBox(height: 8),
                            const Text("FreeFire", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Tabs
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.cyanAccent,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.cyanAccent,
              tabs: const [
                Tab(text: "Game Library"),
                Tab(text: "Sentuhan"),
                Tab(text: "Performance"),
                Tab(text: "Tampilan"),
                Tab(text: "Jaringan"),
                Tab(text: "Mol"),
              ],
            ),
            
            // Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildSwitchTile("Aim Asisst", 
                    "membantu pemain membidik musuh dengan lebih mudah...", aimAssist, 
                    (v) => setState(() => aimAssist = v), Icons.gps_fixed),
                  
                  Row(
                    children: [
                      Expanded(child: _buildSwitchTile("ROG Monitor", 
                        "sistem floating yang menampilkan info CPU GPU SUHU dan FPS", 
                        rogMonitor, (v) => setState(() => rogMonitor = v), Icons.monitor_heart)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildSwitchTile("Fps Optimaze", 
                        "berfungsi untuk menstabilkan dan meningkatkan FPS", 
                        fpsOptimize, (v) => setState(() => fpsOptimize = v), Icons.flash_on)),
                    ],
                  ),
                  
                  _buildSwitchTile("Sensi Optimaze", 
                    "sistem floating yang menampilkan info CPU GPU SUHU dan FPS", 
                    sensiOptimize, (v) => setState(() => sensiOptimize = v), Icons.tune),
                  
                  _buildSwitchTile("Cache Plus Mode", 
                    "mengoptimalkan cache aplikasi agar aplikasi tidak terlalu berat", 
                    cacheMode, (v) => setState(() => cacheMode = v), Icons.cleaning_services),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, bool value, Function(bool) onChanged, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D23),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.cyanAccent),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: const
