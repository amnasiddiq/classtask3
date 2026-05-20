import 'package:flutter/material.dart';
// Amna Siddiqui
//2380226
void main() {
  runApp(const AdaptiveProfileApp());
}

class AdaptiveProfileApp extends StatelessWidget {
  const AdaptiveProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adaptive UI Design',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine screen orientation and size for padding adjustments
    final viewSize = MediaQuery.sizeOf(context);
    final isWide = viewSize.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Center the content and provide a max-width for large screens
            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isWide ? 40.0 : 20.0,
                  vertical: 20.0,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: ProfileCard(
                    maxWidth: constraints.maxWidth,
                    isCompact: !isWide,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final double maxWidth;
  final bool isCompact;

  const ProfileCard({
    super.key,
    required this.maxWidth,
    required this.isCompact,
  });

  @override
  Widget build(BuildContext context) {
    // Dynamic sizing calculations
    final avatarRadius = isCompact ? maxWidth * 0.15 : maxWidth * 0.2;
    final titleFontSize = isCompact ? 18.0 : 24.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Profile Image Section
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(
            Icons.account_circle_rounded,
            size: avatarRadius * 1.2,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 24),
        
        // Action Button Section
        FilledButton.tonalIcon(
          onPressed: () => debugPrint('Navigation: Edit Profile'),
          icon: const Icon(Icons.edit_note),
          label: Text(
            'Update Profile Info',
            style: TextStyle(fontSize: titleFontSize * 0.7),
          ),
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
