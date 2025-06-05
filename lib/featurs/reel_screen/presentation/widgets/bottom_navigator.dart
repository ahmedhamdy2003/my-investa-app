import 'package:flutter/material.dart';
import 'package:investa4/core/utils/constant.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});
  Widget _buildNavItem({required Widget icon, required String label}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              color: Colors.white,
              // padding: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      icon: Image.asset('assets/icon/home.png'),
                      label: 'Home',
                    ),
                    _buildNavItem(
                      icon: Image.asset('assets/icon/Search.png'),
                      label: 'search',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: _buildNavItem(
                        icon: Image.asset('assets/icon/Search.png'),
                        label: 'search',
                      ),
                    ),
                    _buildNavItem(
                      icon: Image.asset('assets/icon/dashboard.png'),
                      label: 'Dashboard',
                    ),
                    _buildNavItem(
                      icon: Image.asset('assets/icon/profile.png'),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: _buildNavItem(
              icon: Container(
                // padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: mainTextColor,
                    ),
                    child: Image.asset('assets/icon/reels.png'),
                  ),
                ),
              ),
              label: 'Reels',
            ),
          ),
        ],
      ),
    );
  }
}
