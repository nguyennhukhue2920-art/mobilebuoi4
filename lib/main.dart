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
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0284C7)),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Màu nền xám bên ngoài khung điện thoại (giống nền canvas của Figma)
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final displayWidth = constraints.maxWidth < 332
                ? constraints.maxWidth - 32
                : 300.0;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Center(
                child: SizedBox(
                  width: displayWidth,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 390,
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: const Color(0xFFCBD5E1),
                          width: 4,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x140F172A),
                            blurRadius: 24,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _TopBar(),
                          SizedBox(height: 20),
                          _ProfileHeader(),
                          SizedBox(height: 24),
                          _StatsRow(),
                          SizedBox(height: 24),
                          _AboutSection(),
                          SizedBox(height: 20),
                          _SkillsSection(),
                          SizedBox(height: 24),
                          _ProjectsSection(),
                          SizedBox(height: 24),
                          _ContactSection(),
                        ],
                      ),
                    ),
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

// 1. TopBar (Row: MainAxisAlignment.spaceBetween)
class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _IconButton(icon: Icons.chevron_left, onPressed: () {}),
        const Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
          ),
        ),
        _IconButton(icon: Icons.share_outlined, onPressed: () {}),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 26,
      height: 38,
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        iconSize: 17,
        color: const Color(0xFF0F172A),
        icon: Icon(icon),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFFE2E8F0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

// 2. Profile Header (Column: CrossAxisAlignment.center)
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Stack (Avatar: 140x140 | Multi-layer)
          SizedBox(
            width: 140,
            height: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Container (Gradient Ring: 140x140 | #FFB088 -> #FF8080 -> #FFCF71)
                Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFB088),
                        Color(0xFFFF8080),
                        Color(0xFFFFCF71),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                // Container (White Border: 132x132)
                Container(
                  width: 132,
                  height: 132,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                // ClipOval > Image (Alex Rivers: 124x124)
                ClipOval(
                  child: Image.asset(
                    'assets/anhdaidien.jpg',
                    width: 124,
                    height: 124,
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned (Verified Badge: 28x28 | Blue #0284C7)
                Positioned(
                  right: 6,
                  bottom: 4,
                  child: Container(
                    width: 22,
                    height: 28,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0284C7),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Text ('Alex Rivers' | 24px w800 | #0F172A)
          const Text(
            'Alex Rivers',
            style: TextStyle(
              color: Color(0xFF0F172A),
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          // Text ('Lead Mobile Engineer' | 15px w500 | #64748B)
          const Text(
            'Lead Mobile Engineer',
            style: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          // Container > Row (Location Pill: Radius 20 | #F1F5F9)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 15,
                  color: Color(0xFF475569),
                ),
                SizedBox(width: 4),
                Text(
                  'Tokyo, Japan',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF334155),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 3. Stats Card (Container > Row: Radius 20 | BoxShadow 0 8 18)
class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    const stats = [
      ('148', 'Projects'),
      ('9 Yrs', 'Experience'),
      ('4.9 ★', 'Rating'),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D0F172A),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          for (var index = 0; index < stats.length; index++) ...[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    stats[index].$1,
                    style: TextStyle(
                      color: index == 2
                          ? const Color(0xFFF59E0B)
                          : const Color(0xFF0F172A),
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    stats[index].$2,
                    style: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            if (index < stats.length - 1)
              const SizedBox(
                height: 34,
                child: VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Color(0xFFE2E8F0),
                ),
              ),
          ],
        ],
      ),
    );
  }
}

// 4. About Me (Column)
class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle('About Me'),
        SizedBox(height: 8),
        Text(
          'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant',
          style: TextStyle(
            color: Color(0xFF64748B),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

// 5. Skills & Expertise (Column > Wrap)
class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build(BuildContext context) {
    const skills = [
      ('Flutter', Icons.flutter_dash, Color(0xFFE0F2FE), Color(0xFF0284C7)),
      ('Dart', Icons.code, Color(0xFFDCFCE7), Color(0xFF16A34A)),
      (
        'Clean Arch',
        Icons.layers_outlined,
        Color(0xFFFEE2E2),
        Color(0xFFDC2626),
      ),
      ('UI/UX', Icons.draw_outlined, Color(0xFFF3E8FF), Color(0xFF9333EA)),
      (
        'Firebase',
        Icons.local_fire_department_outlined,
        Color(0xFFFEF3C7),
        Color(0xFFD97706),
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('Skills & Expertise'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final skill in skills)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: skill.$3,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(skill.$2, size: 15, color: skill.$4),
                    const SizedBox(width: 6),
                    Text(
                      skill.$1,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: skill.$4,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}

// 6. Featured Projects (Row: 2 Expanded Cards)
class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle('Featured Projects'),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _ProjectTile(
                image: 'assets/a1.jpg',
                title: 'E-Shop Flutter',
                subtitle: 'Mobile App • 2026',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _ProjectTile(
                image: 'assets/a2.jpg',
                title: 'Crypto Vault',
                subtitle: 'Finance • Clean Arch',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Card (165x145 | Radius 16)
class _ProjectTile extends StatelessWidget {
  const _ProjectTile({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 85,
              width: double.infinity,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 7. Contact Card (Container > Column: Radius 20 | Shadow 0 4 12)
class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    const contacts = [
      (Icons.alternate_email, 'Contact Information'),
      (Icons.mail_outline, 'alex.rivers@email.com'),
      (Icons.call_outlined, '+81 (90) 1234-5678'),
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          for (var index = 0; index < contacts.length; index++)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF1F5F9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          contacts[index].$1,
                          size: 16,
                          color: const Color(0xFF475569),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          contacts[index].$2,
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: index == 0
                                ? FontWeight.w800
                                : FontWeight.w600,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 18,
                        color: Color(0xFF94A3B8),
                      ),
                    ],
                  ),
                ),
                if (index < contacts.length - 1)
                  const Divider(height: 1, color: Color(0xFFF1F5F9)),
              ],
            ),
        ],
      ),
    );
  }
}

// Heading (17px Bold | #0F172A)
class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF0F172A),
        fontSize: 17,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
