import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'platform_style.dart';

class AdaptiveButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final PlatformStyle style;

  const AdaptiveButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case PlatformStyle.iosModern:
        return Opacity(
          opacity: onPressed == null ? 0.4 : 1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: CupertinoColors.activeBlue.withOpacity(0.9),
            ),
            child: CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              borderRadius: BorderRadius.circular(999),
              color: Colors.transparent,
              onPressed: onPressed,
              child: _content(color: CupertinoColors.white),
            ),
          ),
        );

      case PlatformStyle.iosLegacy:
        return CupertinoButton.filled(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          borderRadius: BorderRadius.circular(8),
          onPressed: onPressed,
          child: _content(color: CupertinoColors.white),
        );

      case PlatformStyle.material:
        if (icon == null) {
          return FilledButton(onPressed: onPressed, child: Text(label));
        }
        return FilledButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: Text(label),
        );
    }
  }

  Widget _content({required Color color}) {
    if (icon == null) return Text(label, style: TextStyle(color: color));
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 8),
        Text(label, style: TextStyle(color: color)),
      ],
    );
  }
}

class AdaptiveDestination {
  final IconData icon;
  final IconData cupertinoIcon;
  final String label;
  const AdaptiveDestination({
    required this.icon,
    required this.cupertinoIcon,
    required this.label,
  });
}

class AdaptiveBottomNav extends StatelessWidget {
  final List<AdaptiveDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final PlatformStyle style;

  const AdaptiveBottomNav({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case PlatformStyle.iosModern:
        return _ModernPillNav(
          destinations: destinations,
          selectedIndex: selectedIndex,
          onTap: onTap,
        );

      case PlatformStyle.iosLegacy:
        return CupertinoTabBar(
          currentIndex: selectedIndex,
          onTap: onTap,
          items: [
            for (final d in destinations)
              BottomNavigationBarItem(icon: Icon(d.cupertinoIcon), label: d.label),
          ],
        );

      case PlatformStyle.material:
        return NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: onTap,
          destinations: [
            for (final d in destinations)
              NavigationDestination(icon: Icon(d.icon), label: d.label),
          ],
        );
    }
  }
}

class _ModernPillNav extends StatelessWidget {
  final List<AdaptiveDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const _ModernPillNav({
    required this.destinations,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < destinations.length; i++)
                    GestureDetector(
                      onTap: () => onTap(i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: i == selectedIndex
                              ? CupertinoColors.activeBlue.withOpacity(0.15)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Icon(
                          destinations[i].cupertinoIcon,
                          color: i == selectedIndex
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: CupertinoColors.systemGrey6,
              shape: BoxShape.circle,
            ),
            child: const Icon(CupertinoIcons.search, color: CupertinoColors.systemGrey),
          ),
        ],
      ),
    );
  }
}