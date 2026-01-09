import 'package:expose_corruption_app/components/bottom_navbar.dart';
import 'package:expose_corruption_app/screens/contact.dart';
import 'package:expose_corruption_app/screens/settings.dart';
import 'package:expose_corruption_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
        title: const Text(
          'Help & FAQ',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 4),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for help...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                            });
                          },
                        )
                      : null,
                ),
                onChanged: (value) => setState(() {}),
              ),
              const SizedBox(height: AppTheme.spacing24),

              // Quick Links
              const Text('Quick Links', style: AppTheme.h3),
              const SizedBox(height: AppTheme.spacing16),
              Row(
                children: [
                  Expanded(
                    child: _buildQuickLinkCard(
                      icon: Icons.play_circle_outline,
                      title: 'Getting Started',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacing12),
                  Expanded(
                    child: _buildQuickLinkCard(
                      icon: Icons.videocam_outlined,
                      title: 'Video Tutorials',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacing32),

              // FAQs
              const Text(
                'Frequently Asked Questions',
                style: AppTheme.h3,
              ),
              const SizedBox(height: AppTheme.spacing16),
              _buildFAQSection(
                'Reporting',
                [
                  {
                    'question': 'How do I submit a corruption report?',
                    'answer':
                        "To submit a corruption report, click the 'Report Corruption' button on the home page. Fill in all required details including description, location, involved parties, and date. You can also upload supporting evidence."
                  },
                  {
                    'question': 'Can I report anonymously?',
                    'answer':
                        'Yes, you can report anonymously without providing your personal details. Your identity is protected and all submissions are confidential.'
                  },
                  {
                    'question': 'What types of corruption can I report?',
                    'answer':
                        'You can report various types including bribery, embezzlement, fraud, nepotism, abuse of power, and other forms of corruption.'
                  },
                ],
              ),
              const SizedBox(height: AppTheme.spacing16),
              _buildFAQSection(
                'Tracking & Updates',
                [
                  {
                    'question': 'How do I track the status of my report?',
                    'answer':
                        "Visit 'My Reports' or 'Report Status' on the homepage to check the progress of your submitted reports. You'll see a timeline of actions taken."
                  },
                  {
                    'question': 'How long does it take to process a report?',
                    'answer':
                        'Most reports are reviewed within 14-21 business days. Complex cases may take longer. You\'ll receive updates via notifications.'
                  },
                ],
              ),
              const SizedBox(height: AppTheme.spacing32),

              // Contact Support Card
              Container(
                padding: const EdgeInsets.all(AppTheme.spacing20),
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  boxShadow: AppTheme.cardShadow,
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.support_agent,
                      size: 48,
                      color: Colors.white,
                    ),
                    const SizedBox(height: AppTheme.spacing12),
                    const Text(
                      'Need More Help?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacing8),
                    const Text(
                      'Contact our support team',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacing16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Contact()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppTheme.primaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.spacing32,
                          vertical: AppTheme.spacing12,
                        ),
                      ),
                      child: const Text(
                        'Contact Us',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.spacing24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickLinkCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      child: Container(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        decoration: AppTheme.cardDecoration(),
        child: Column(
          children: [
            Icon(icon, size: 32, color: AppTheme.primaryColor),
            const SizedBox(height: AppTheme.spacing8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQSection(String title, List<Map<String, String>> faqs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTheme.subtitle1),
        const SizedBox(height: AppTheme.spacing8),
        ...faqs.map((faq) => Container(
              margin: const EdgeInsets.only(bottom: AppTheme.spacing8),
              decoration: AppTheme.cardDecoration(),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacing16,
                  vertical: AppTheme.spacing8,
                ),
                childrenPadding: const EdgeInsets.fromLTRB(
                  AppTheme.spacing16,
                  0,
                  AppTheme.spacing16,
                  AppTheme.spacing16,
                ),
                title: Text(
                  faq['question']!,
                  style: AppTheme.subtitle2,
                ),
                children: [
                  Text(
                    faq['answer']!,
                    style: AppTheme.body2,
                  ),
                ],
              ),
            )),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
