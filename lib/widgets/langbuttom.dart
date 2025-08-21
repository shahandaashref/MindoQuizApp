import 'package:flutter/material.dart';
import 'package:mindo/localprovider.dart';
import 'package:provider/provider.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    
    return PopupMenuButton<String>(
      onSelected: (String value) {
        if (value == 'en') {
          localeProvider.setLocale(const Locale('en', ''));
        } else if (value == 'ar') {
          localeProvider.setLocale(const Locale('ar', ''));
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'en',
          child: Row(
            children: [
              const Icon(Icons.language),
              const SizedBox(width: 8),
              Text('English'),
              if (localeProvider.locale.languageCode == 'en')
                const Icon(Icons.check, color: Colors.green),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'ar',
          child: Row(
            children: [
              const Icon(Icons.language),
              const SizedBox(width: 8),
              Text('العربية'),
              if (localeProvider.locale.languageCode == 'ar')
                const Icon(Icons.check, color: Colors.green),
            ],
          ),
        ),
      ],
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.language),
            const SizedBox(width: 4),
            Text(localeProvider.locale.languageCode == 'ar' ? 'ع' : 'En'),
          ],
        ),
      ),
    );
  }
}

// أو زر بسيط للتنقل بين اللغات
class SimpleLanguageToggle extends StatelessWidget {
  const SimpleLanguageToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    
    return IconButton(
      onPressed: () {
        localeProvider.toggleLocale();
      },
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.language),
          const SizedBox(width: 4),
          Text(
            localeProvider.locale.languageCode == 'ar' ? 'ع' : 'En',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}