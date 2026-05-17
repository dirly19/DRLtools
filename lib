import 'package:flutter/material.dart';

void main() {
  runApp(const MyToolsApp());
}

class MyToolsApp extends StatelessWidget {
  const MyToolsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Tools',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E13),
        cardColor: const Color(0xFF151A20),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFF00E5FF),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  // State untuk Game Console
  bool aimAssist = false;
  bool rogMonitor = true;
  bool fpsOptimaze = true;
  bool sensiOptimaze = true;
  bool cachePlus = true;

  // State untuk Crosahir
  bool showCrosshair = true;
  double crosshairSize = 50.0;
  Color crosshairColor = Colors.red;

  // State loading
  bool isLoading = false;
  double loadProgress = 0.7;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header App
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.flash_on, color: Color(0xFF00E5FF), size: 32),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('MY TOOLS', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                      Text('v1.0.0', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00E5FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('2026', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            // Status Shizuku Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: const Color(0xFF1A1F26),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 18),
                          const SizedBox(width: 6),
                          const Text('Shizuku API 13.6.0', style: TextStyle(color: Colors.green)),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text('Running', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text('GameData', style: TextStyle(color: Colors.green)),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: loadProgress,
                        color: const Color(0xFF00E5FF),
                        backgroundColor: Colors.grey[800],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Tab Bar
            TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFF00E5FF),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
              tabs: const [
                Tab(text: 'CROSAHIR'),
                Tab(text: 'GAME CONSOLE'),
              ],
            ),

            // Tab Content
            Expanded(
              child: isLoading
                 ? const Center(child: CircularProgressIndicator(color: Color(0xFF00E5FF)))
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        _buildCrosshairTab(),
                        _buildGameConsoleTab(),
                      ],
                    ),
            ),

            // Bottom Nav
            BottomNavigationBar(
              backgroundColor: const Color(0xFF0A0E13),
              selectedItemColor: const Color(0xFF00E5FF),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.center_focus_strong), label: 'Tools'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCrosshairTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text('SHOWCROSAHIR'),
              subtitle: const Text('Kustomisasi crosshair kamu'),
              trailing: Switch(
                value: showCrosshair,
                onChanged: (v) => setState(() => showCrosshair = v),
                activeColor: const Color(0xFF00E5FF),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('SIZE', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${crosshairSize.toInt()}%', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Slider(
                    value: crosshairSize,
                    min: 0,
                    max: 100,
                    onChanged: (v) => setState(() => crosshairSize = v),
                    activeColor: const Color(0xFF00E5FF),
                  ),
                  OutlinedButton(
                    onPressed: () => setState(() => crosshairSize = 50),
                    child: const Text('RESET SIZE'),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('WARNA', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    children: [Colors.red, Colors.green, Colors.yellow, Colors.white, Colors.cyan, Colors.black]
                       .map((color) => GestureDetector(
                              onTap: () => setState(() => crosshairColor = color),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: crosshairColor == color? const Color(0xFF00E5FF) : Colors.grey,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ))
                       .toList(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameConsoleTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            color: const Color(0xFF1A1F26),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.sports_esports, color: Color(0xFF00E5FF), size: 32),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('FREEFIRE', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                      Text('Game Console', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('RUNNING', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildToggleCard('AIM ASSIST', 'Bantu ngarahin aim pas deket musuh', aimAssist, (v) => setState(() => aimAssist = v)),
          _buildToggleCard('ROG MONITOR', 'Tampilin info CPU, GPU, FPS, Suhu', rogMonitor, (v) => setState(() => rogMonitor = v)),
          _buildToggleCard('FPS OPTIMAZE', 'Optimasi biar FPS lebih stabil', fpsOptimaze, (v) => setState(() => fpsOptimaze = v)),
          _buildToggleCard('SENSI OPTIMAZE', 'Optimasi sensitivitas biar responsif', sensiOptimaze, (v) => setState(() => sensiOptimaze = v)),
          _buildToggleCard('CACHE PLUS MODE', 'Bersihin cache biar game lebih ringan', cachePlus, (v) => setState(() => cachePlus = v)),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Launch FreeFire...'), backgroundColor: Color(0xFF00E5FF)),
                );
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('LAUNCH GAME', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00E5FF),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildToggleCard(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF00E5FF),
        ),
      ),
    );
  }
}
