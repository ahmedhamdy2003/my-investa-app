import 'package:flutter/material.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/sucurity_screens/secureTransaction/secure_transaction.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/sucurity_screens/transparent/transparent.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/sucurity_screens/twoFactor/two_factor.dart';
import 'package:investa4/presentation/screens/main_layout/profile_screens/sucurity_screens/verified/verified.dart';

import '../../tabs/profile/profile.dart';
import 'banck_level/banck_level.dart';
import 'cleer_fees/cleer_fees.dart';
import 'direct_access/direct_access.dart';
import 'disputeResolution/dispute_resolution.dart';
import 'legallyBound/legally_bound.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF001F3F),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Security', style: TextStyle(color: Colors.black)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              '🛡️ Why You’re Safe With Us ?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            _buildSecurityItem(
              text: '🔒 Bank-Level Data Protection',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BankLevel()),
                );
              },
            ),
            _buildSecurityItem(
              text: '🧠 Verified & Vetted Projects',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Verified()),
                );
              },
            ),
            _buildSecurityItem(
              text: '📜 Legally-Bound Agreements',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LegallyBound()),
                );
              },
            ),
            _buildSecurityItem(
              text: '🔍 Transparent Monitoring',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Transparent()),
                );
              },
            ),
            _buildSecurityItem(
              text: '🧾 Clear Fees, No Surprises',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ClearFees()),
                );
              },
            ),
            _buildSecurityItem(
              text: '📲 Two-Factor Authentication',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TwoFactor()),
                );
              },
            ),
            _buildSecurityItem(
              text: '💬 Direct Access to Founders',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DirectAccess()),
                );
              },
            ),
            _buildSecurityItem(
              text: '⚖️ Dispute Resolution & Legal Support',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DisputeResolution(),
                  ),
                );
              },
            ),
            _buildSecurityItem(
              text: '💳 Secure Transactions Only',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecureTransaction(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityItem({
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
