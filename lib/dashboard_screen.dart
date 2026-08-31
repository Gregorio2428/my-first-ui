import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'platform_style.dart';
import 'adaptive_widgets.dart';
import 'car_data.dart';

class Breakpoints {
  static const double tablet = 600;
  static const double desktop = 1024;

  static bool isTablet(double w) => w >= tablet && w < desktop;
  static bool isDesktop(double w) => w >= desktop;
}

typedef _Dest = ({IconData icon, IconData cupertinoIcon, String label});

const _destinations = <_Dest>[
  (icon: Icons.dashboard_outlined, cupertinoIcon: CupertinoIcons.square_grid_2x2, label: 'Dashboard'),
  (icon: Icons.settings_outlined, cupertinoIcon: CupertinoIcons.settings, label: 'Settings'),
  (icon: Icons.info_outline, cupertinoIcon: CupertinoIcons.info, label: 'About'),
  (icon: Icons.logout, cupertinoIcon: CupertinoIcons.square_arrow_right, label: 'Logout'),
];

// ============================================================================
// SCREEN
// ============================================================================
class DashboardScreen extends StatefulWidget {
  final TargetOS os;
  const DashboardScreen({super.key, required this.os});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (Breakpoints.isDesktop(width)) {
          return _DesktopShell(
            selectedIndex: selectedIndex,
            onSelect: (i) => setState(() => selectedIndex = i),
            os: widget.os,
          );
        }

        return _CompactShell(
          selectedIndex: selectedIndex,
          onSelect: (i) => setState(() => selectedIndex = i),
          os: widget.os,
          columns: Breakpoints.isTablet(width) ? 4 : 2,
        );
      },
    );
  }
}

// ============================================================================
// MOBILE + TABLET
// ============================================================================
class _CompactShell extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final TargetOS os;
  final int columns;

  const _CompactShell({
    required this.selectedIndex,
    required this.onSelect,
    required this.os,
    required this.columns,
  });

  @override
  State<_CompactShell> createState() => _CompactShellState();
}

class _CompactShellState extends State<_CompactShell> {
  bool _drawerOpen = false;

  void _toggleDrawer() => setState(() => _drawerOpen = !_drawerOpen);

  void _select(int i) {
    widget.onSelect(i);
    setState(() => _drawerOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    final title = _destinations[widget.selectedIndex].label;
    final isIOS = widget.os == TargetOS.ios;

    final body = Stack(
      children: [
        _ContentBody(selectedIndex: widget.selectedIndex, columns: widget.columns),
        if (_drawerOpen)
          GestureDetector(
            onTap: _toggleDrawer,
            child: Container(color: Colors.black.withOpacity(0.35)),
          ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          left: _drawerOpen ? 0 : -260,
          top: 0,
          bottom: 0,
          width: 260,
          child: _NavPanel(selectedIndex: widget.selectedIndex, onSelect: _select, os: widget.os),
        ),
      ],
    );

    if (isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(title),
          leading: GestureDetector(
            onTap: _toggleDrawer,
            child: const Icon(CupertinoIcons.line_horizontal_3),
          ),
        ),
        child: SafeArea(child: body),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: _toggleDrawer),
      ),
      body: body,
    );
  }
}

// ============================================================================
// DESKTOP
// ============================================================================
class _DesktopShell extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final TargetOS os;

  const _DesktopShell({required this.selectedIndex, required this.onSelect, required this.os});

  @override
  Widget build(BuildContext context) {
    final title = _destinations[selectedIndex].label;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(width: 220, child: _NavPanel(selectedIndex: selectedIndex, onSelect: onSelect, os: os)),
          const VerticalDivider(width: 1),
          Expanded(
            child: Column(
              children: [
                AppBar(title: Text(title), automaticallyImplyLeading: false),
                Expanded(
                  child: selectedIndex == 0
                      ? const _DesktopDashboardBody()
                      : _ContentBody(selectedIndex: selectedIndex, columns: 4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopDashboardBody extends StatelessWidget {
  const _DesktopDashboardBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  _CarTypeGrid(columns: 4),
                  SizedBox(height: 16),
                  _TopCarsList(),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Column(
              children: const [
                Expanded(flex: 2, child: _TrendRankingPanel()),
                SizedBox(height: 12),
                Expanded(child: _TrendLineChartPanel()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Shared nav panel
// ============================================================================
class _NavPanel extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final TargetOS os;

  const _NavPanel({required this.selectedIndex, required this.onSelect, required this.os});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(20), child: Icon(Icons.favorite, size: 32)),
            for (int i = 0; i < _destinations.length; i++)
              ListTile(
                leading: Icon(os == TargetOS.ios ? _destinations[i].cupertinoIcon : _destinations[i].icon),
                title: Text(_destinations[i].label.toUpperCase(),
                    style: const TextStyle(fontSize: 13, letterSpacing: 0.5)),
                selected: i == selectedIndex,
                onTap: () => onSelect(i),
              ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// Body router
// ============================================================================
class _ContentBody extends StatelessWidget {
  final int selectedIndex;
  final int columns;

  const _ContentBody({required this.selectedIndex, required this.columns});

  @override
  Widget build(BuildContext context) {
    switch (_destinations[selectedIndex].label) {
      case 'Settings':
        return const _SettingsPage();
      case 'About':
        return const _AboutPage();
      case 'Logout':
        return const _LogoutPage();
      default:
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CarTypeGrid(columns: columns),
              const SizedBox(height: 20),
              const Text('Trend Ranking', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              const _TrendRankingPanel(),
              const SizedBox(height: 20),
              const Text('Trend Over Time', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              const SizedBox(height: 200, child: _TrendLineChartPanel()),
              const SizedBox(height: 20),
              const Text('Top 5 Most Bought', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              const _TopCarsList(),
            ],
          ),
        );
    }
  }
}

class _CarTypeGrid extends StatelessWidget {
  final int columns;
  const _CarTypeGrid({required this.columns});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: columns,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.1,
      children: [
        for (final car in carTypes)
          GestureDetector(
            onTap: () => _showCarDialog(context, car),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(car.imagePath, fit: BoxFit.cover),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.65)],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: 10,
                    child: Text(
                      car.label,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

void _showCarDialog(BuildContext context, CarTypeInfo car) {
  showDialog<void>(
    context: context,
    builder: (ctx) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(car.imagePath, height: 140, width: double.infinity, fit: BoxFit.cover),
                ),
                const SizedBox(height: 12),
                Text(car.label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 14),
                Text(car.description),
                const SizedBox(height: 14),
                const Text('Typical specs', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                for (final s in car.specs)
                  Padding(padding: const EdgeInsets.only(bottom: 4), child: Text('\u2022 $s')),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: AdaptiveButton(
                    label: 'Close',
                    style: PlatformStyle.iosModern,
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class _TrendRankingPanel extends StatelessWidget {
  const _TrendRankingPanel();

  @override
  Widget build(BuildContext context) {
    final sorted = [...trendRanking]..sort((a, b) => a.rank.compareTo(b.rank));
    final maxShare = sorted.map((e) => e.sharePercent).reduce((a, b) => a > b ? a : b);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Buyer Preference Ranking', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          for (final t in sorted)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  SizedBox(width: 22, child: Text('#${t.rank}', style: const TextStyle(fontWeight: FontWeight.bold))),
                  SizedBox(width: 80, child: Text(_labelFor(t.category), overflow: TextOverflow.ellipsis)),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: t.sharePercent / maxShare,
                        minHeight: 10,
                        backgroundColor: Colors.grey.shade200,
                        color: _colorFor(t.category),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('${t.sharePercent.toStringAsFixed(0)}%'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

String _labelFor(CarCategory c) => carTypes.firstWhere((e) => e.category == c).label;
Color _colorFor(CarCategory c) => carTypes.firstWhere((e) => e.category == c).color;

class _TrendLineChartPanel extends StatelessWidget {
  const _TrendLineChartPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Popularity Trend (6 months)', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(child: CustomPaint(painter: _TrendChartPainter(), child: Container())),
          const SizedBox(height: 6),
          Wrap(
            spacing: 12,
            children: [
              for (final c in CarCategory.values)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 10, height: 10, color: _colorFor(c)),
                    const SizedBox(width: 4),
                    Text(_labelFor(c), style: const TextStyle(fontSize: 11)),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TrendChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const maxValue = 40.0;
    const leftPad = 6.0;
    const rightPad = 6.0;
    const topPad = 6.0;
    const bottomPad = 18.0;

    final chartWidth = size.width - leftPad - rightPad;
    final chartHeight = size.height - topPad - bottomPad;

    final axisPaint = Paint()
      ..color = const Color(0xFFDDDDDD)
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(leftPad, size.height - bottomPad),
      Offset(size.width - rightPad, size.height - bottomPad),
      axisPaint,
    );

    for (final category in CarCategory.values) {
      final series = trendSeries[category]!;
      final paint = Paint()
        ..color = _colorFor(category)
        ..strokeWidth = 2.5
        ..style = PaintingStyle.stroke;

      final path = Path();
      for (int i = 0; i < series.length; i++) {
        final x = leftPad + (chartWidth * i / (series.length - 1));
        final y = topPad + chartHeight - (chartHeight * series[i] / maxValue);
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      canvas.drawPath(path, paint);
    }

    for (int i = 0; i < trendMonthLabels.length; i++) {
      final x = leftPad + (chartWidth * i / (trendMonthLabels.length - 1));
      final tp = TextPainter(
        text: TextSpan(text: trendMonthLabels[i], style: const TextStyle(fontSize: 10, color: Colors.grey)),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(x - tp.width / 2, size.height - bottomPad + 4));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TopCarsList extends StatelessWidget {
  const _TopCarsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final car in topCarsInPhilippines)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(car.brand, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      Text('${car.name} (${car.model})', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Text('\u20b1${_formatPrice(car.pricePhp)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
      ],
    );
  }

  String _formatPrice(int value) {
    final s = value.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final posFromEnd = s.length - i;
      buffer.write(s[i]);
      if (posFromEnd > 1 && posFromEnd % 3 == 1) buffer.write(',');
    }
    return buffer.toString();
  }
}

class _SettingsPage extends StatefulWidget {
  const _SettingsPage();

  @override
  State<_SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<_SettingsPage> {
  bool notificationsOn = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Notifications'),
              const Spacer(),
              Switch(value: notificationsOn, onChanged: (v) => setState(() => notificationsOn = v)),
            ],
          ),
          const SizedBox(height: 12),
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeModeNotifier,
            builder: (context, mode, _) {
              final isDark = mode == ThemeMode.dark;
              return Row(
                children: [
                  const Text('Dark Mode'),
                  const Spacer(),
                  Switch(
                    value: isDark,
                    onChanged: (v) => themeModeNotifier.value = v ? ThemeMode.dark : ThemeMode.light,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          AdaptiveButton(label: 'Save Changes', style: PlatformStyle.iosModern, onPressed: () {}),
        ],
      ),
    );
  }
}

class _AboutPage extends StatelessWidget {
  const _AboutPage();

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('Greg Danielle C. Duetes', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('BS Data Science 4A'),
            SizedBox(height: 12),
            Text('A responsive + adaptive dashboard demo built with Flutter.'),
          ],
        ),
      );
}

class _LogoutPage extends StatelessWidget {
  const _LogoutPage();
  @override
  Widget build(BuildContext context) =>
      const Padding(padding: EdgeInsets.all(16), child: Text('You have been logged out (placeholder).'));
}