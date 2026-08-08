import 'package:flutter/material.dart';

void main() {
  runApp(const DialingApp());
}

class DialingApp extends StatelessWidget {
  const DialingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dialing Screen',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const DialingScreen(),
    );
  }
}

class DialingScreen extends StatelessWidget {
  const DialingScreen({super.key});

  // Palette pulled from the reference image
  static const Color accentBlue = Color(0xFF2FBEEA);
  static const Color darkNavy = Color(0xFF1B1B2F);
  static const Color subtleGrey = Color(0xFF6E6E73);
  static const Color dividerGrey = Color(0xFFE3E3E8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            // "Dialing" title
            const Text(
              'Dialing',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: darkNavy,
              ),
            ),
            const SizedBox(height: 40),

            // Avatar with concentric pulse rings
            _buildAvatarWithRings(),

            const SizedBox(height: 28),

            // Name
            const Text(
              'JUAN LUNA',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: darkNavy,
              ),
            ),
            const SizedBox(height: 8),

            // Phone number
            const Text(
              '+ 476-229-9449',
              style: TextStyle(
                fontSize: 15,
                color: subtleGrey,
              ),
            ),

            const Spacer(),

            // Divider line
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              height: 1,
              color: dividerGrey,
            ),
            const SizedBox(height: 24),

            // Top row: Mute, Bluetooth, Hold
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCallOption(icon: Icons.mic_off, label: 'Mute'),
                _buildCallOption(icon: Icons.bluetooth, label: 'Bluetooth'),
                _buildCallOption(icon: Icons.pause_circle_outline, label: 'Hold'),
              ],
            ),

            const SizedBox(height: 32),

            // Bottom row: Keypad, End call, Speaker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.apps, color: subtleGrey, size: 26),
                _buildEndCallButton(),
                Icon(Icons.volume_up_outlined, color: subtleGrey, size: 26),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Concentric rings around the profile photo
  Widget _buildAvatarWithRings() {
    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accentBlue.withOpacity(0.15),
            ),
          ),
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accentBlue.withOpacity(0.30),
            ),
          ),
          Container(
            width: 130,
            height: 130,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: accentBlue,
            ),
            padding: const EdgeInsets.all(4),
            child: ClipOval(
               child: Image.asset(
      'lib/images/profile.png',
      fit: BoxFit.cover,
    ),
            ),
          ),
        ],
      ),
    );
  }

  // Small icon + label used for Mute / Bluetooth / Hold
  Widget _buildCallOption({required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(icon, color: subtleGrey, size: 26),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: subtleGrey),
        ),
      ],
    );
  }

  // Blue circular "end call / answer" button
  Widget _buildEndCallButton() {
    return Container(
      width: 58,
      height: 58,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: accentBlue,
      ),
      child: const Icon(
        Icons.call,
        color: Colors.white,
        size: 26,
      ),
    );
  }
}