import 'package:cards_calculator/custom_theme.dart';
import 'package:cards_calculator/routes.dart';
import 'package:cards_calculator/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'НАСТРОЙКИ',
                style: context.textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 32),
            SettingsButton(
              iconPath: 'assets/key_hole.png',
              title: 'Политика конфиденциальности',
              onTap: () => _onPrivacyPolicyTap(context),
            ),
            SettingsButton(
              iconPath: 'assets/chat.png',
              title: 'Условия использования',
              onTap: () => _onTermsOfUseTap(context),
            ),
            SettingsButton(
              iconPath: 'assets/heart.png',
              title: 'Оцените наше приложений в AppStore',
              onTap: () => _onRateAppTap(context),
            ),
          ],
        ),
      ),
    );
  }

  void _onRateAppTap(BuildContext context) =>
      context.pushNamed(Routes.u, extra: 'https://www.youtube.com/');

  void _onTermsOfUseTap(BuildContext context) {}

  void _onPrivacyPolicyTap(BuildContext context) {}
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  final String iconPath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: CustomTheme.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
