import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/core/widgets/section_title.dart';
import 'package:portfolio/core/widgets/app_button.dart';
import 'package:portfolio/core/widgets/page_wrapper.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  static const String contactEmail = 'deve.abdulhalim@gmail.com';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return PageWrapper(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 40,
        ),
        child: Column(
          children: [
            const SectionTitle(title: 'Contact Me', hasUnderline: true),
            const SizedBox(height: 20),
            Text(
              'Feel free to get in touch with me. I am always open to discussing new projects, creative ideas or opportunities to be part of your visions.',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white70
                        : AppTheme.textSecondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            isMobile
                ? _buildMobileContactContent(context)
                : _buildDesktopContactContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopContactContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _buildContactForm(context)),
        const SizedBox(width: 40),
        Expanded(flex: 4, child: _buildContactInfo(context)),
      ],
    );
  }

  Widget _buildMobileContactContent(BuildContext context) {
    return Column(
      children: [
        _buildContactInfo(context),
        const SizedBox(height: 40),
        _buildContactForm(context),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1A202C)
                : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Message',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : AppTheme.textPrimaryColor,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: _buildInputDecoration('Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: _buildInputDecoration('Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _subjectController,
              decoration: _buildInputDecoration('Subject'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              decoration: _buildInputDecoration('Message'),
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: AppButton(
                text: _isSending ? 'Sending...' : 'Send Message',
                onPressed: _isSending ? () {} : _sendMessage,
                icon: Icons.send,
                isFullWidth: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1A202C)
                : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: 20),
          _buildContactItem(
            context,
            FontAwesomeIcons.envelope,
            'Email',
            contactEmail,
            'mailto:$contactEmail',
          ),
          const SizedBox(height: 16),
          _buildContactItem(
            context,
            FontAwesomeIcons.phone,
            'Phone',
            '+880 1780998486',
            'tel:+8801780998486',
          ),

          _buildContactItem(
            context,
            FontAwesomeIcons.whatsapp,
            'Whatsapp',
            '+880 1780998486',
            'https://wa.me/8801780998486',
          ),

          const SizedBox(height: 16),
          _buildContactItem(
            context,
            FontAwesomeIcons.locationDot,
            'Location',
            'Bhola, Bangladesh',
            'https://maps.google.com/?q=Bhola',
          ),
          const SizedBox(height: 30),
          Divider(
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white24
                    : Colors.black12,
          ),
          const SizedBox(height: 20),
          Text(
            'Social Profiles',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSocialIcon(
                FontAwesomeIcons.github,
                'https://github.com/abdulhalim447',
                context,
              ),
              _buildSocialIcon(
                FontAwesomeIcons.linkedin,
                'https://www.linkedin.com/in/dev-abdul-halim',
                context,
              ),
              _buildSocialIcon(
                FontAwesomeIcons.facebook,
                'https://www.facebook.com/abdulhalimbaccu',
                context,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.schedule,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Available for Freelance',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : AppTheme.textPrimaryColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'I am currently available for freelance projects',
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white70
                                  : AppTheme.textSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    IconData icon,
    String title,
    String detail,
    String url,
  ) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: FaIcon(icon, size: 18, color: AppTheme.primaryColor),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppTheme.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detail,
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white70
                            : AppTheme.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url, BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(url),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.white10
                  : Colors.black.withOpacity(0.08),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 18,
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : AppTheme.textPrimaryColor,
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
      ),
      floatingLabelStyle: const TextStyle(color: AppTheme.primaryColor),
    );
  }

  void _sendMessage() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      // Prepare email parameters
      final String subject = _subjectController.text;
      final String body =
          'Name: ${_nameController.text}\n'
          'Email: ${_emailController.text}\n\n'
          '${_messageController.text}';

      // Launch email client with pre-filled data
      _launchEmailClient(subject, body);

      // Simulate sending a message
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isSending = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Message sent successfully!'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );

        _nameController.clear();
        _emailController.clear();
        _subjectController.clear();
        _messageController.clear();
      });
    }
  }

  Future<void> _launchEmailClient(String subject, String body) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: contactEmail,
      query: _encodeQueryParameters({'subject': subject, 'body': body}),
    );

    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch email client');
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
