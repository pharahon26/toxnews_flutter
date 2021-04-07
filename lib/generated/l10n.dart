// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Toxnews`
  String get appTitle {
    return Intl.message(
      'Toxnews',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `V0.3 Beta`
  String get appVersion {
    return Intl.message(
      'V0.3 Beta',
      name: 'appVersion',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get pageNameWelcome {
    return Intl.message(
      'Welcome',
      name: 'pageNameWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get pageNameSignIn {
    return Intl.message(
      'Sign In',
      name: 'pageNameSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get pageNameRegister {
    return Intl.message(
      'Register',
      name: 'pageNameRegister',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get pageNameSignUp {
    return Intl.message(
      'Sign up',
      name: 'pageNameSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get pageNameHome {
    return Intl.message(
      'Home',
      name: 'pageNameHome',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get pageNameAbout {
    return Intl.message(
      'About',
      name: 'pageNameAbout',
      desc: '',
      args: [],
    );
  }

  /// `Read from the source`
  String get buttonReachBase {
    return Intl.message(
      'Read from the source',
      name: 'buttonReachBase',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get buttonOk {
    return Intl.message(
      'Ok',
      name: 'buttonOk',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get buttonClose {
    return Intl.message(
      'Close',
      name: 'buttonClose',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get buttonConfirm {
    return Intl.message(
      'Confirm',
      name: 'buttonConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get buttonCancel {
    return Intl.message(
      'Cancel',
      name: 'buttonCancel',
      desc: '',
      args: [],
    );
  }

  /// `Open source licences`
  String get buttonOpenSourceLicence {
    return Intl.message(
      'Open source licences',
      name: 'buttonOpenSourceLicence',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get buttonName {
    return Intl.message(
      'Name',
      name: 'buttonName',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get buttonMail {
    return Intl.message(
      'Mail',
      name: 'buttonMail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get buttonPassword {
    return Intl.message(
      'Password',
      name: 'buttonPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with your google account`
  String get buttonGoogleSignIn {
    return Intl.message(
      'Sign in with your google account',
      name: 'buttonGoogleSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with your google account`
  String get buttonGoogleSignUp {
    return Intl.message(
      'Sign Up with your google account',
      name: 'buttonGoogleSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back to `
  String get textWelcomeBack {
    return Intl.message(
      'Welcome back to ',
      name: 'textWelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to `
  String get textWelcome {
    return Intl.message(
      'Welcome to ',
      name: 'textWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Newcomer? not for long `
  String get textNewcomer {
    return Intl.message(
      'Newcomer? not for long ',
      name: 'textNewcomer',
      desc: '',
      args: [],
    );
  }

  /// `You may agree to our `
  String get textAgree {
    return Intl.message(
      'You may agree to our ',
      name: 'textAgree',
      desc: '',
      args: [],
    );
  }

  /// `Yes, I have read and I agree `
  String get textGiveAgreement {
    return Intl.message(
      'Yes, I have read and I agree ',
      name: 'textGiveAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Terms of services `
  String get textTerms {
    return Intl.message(
      'Terms of services ',
      name: 'textTerms',
      desc: '',
      args: [],
    );
  }

  /// `\nToxnews Terms of Service\n\n1. Terms\n\nBy accessing our app, Toxnews, you are agreeing to be bound by these terms of service, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing Toxnews. The materials contained in Toxnews are protected by applicable copyright and trademark law.\n\n2. Use License\n\n\nPermission is granted to temporarily download one copy of Toxnews per device for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:\n\nmodify or copy the materials;\n\nuse the materials for any commercial purpose, or for any public display (commercial or non-commercial);\nattempt to decompile or reverse engineer any software contained in Toxnews;\nremove any copyright or other proprietary notations from the materials; or\ntransfer the materials to another person or "mirror" the materials on any other server.\n\n\nThis license shall automatically terminate if you violate any of these restrictions and may be terminated by Toxnews at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.\n\n3. Disclaimer\n\nThe materials within Toxnews are provided on an 'as is' basis. Toxnews makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.\nFurther, Toxnews does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its website or otherwise relating to such materials or on any sites linked to Toxnews.\n\n4. Limitations\n\nIn no event shall Toxnews or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use Toxnews, even if Toxnews or a Toxnews authorised representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.\n\n5. Accuracy of materials\n\nThe materials appearing in Toxnews could include technical, typographical, or photographic errors. Toxnews does not warrant that any of the materials on Toxnews are accurate, complete or current. Toxnews may make changes to the materials contained in Toxnews at any time without notice. However Toxnews does not make any commitment to update the materials.\n\n6. Links\n\nToxnews has not reviewed all of the sites linked to its app and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Toxnews of the site. Use of any such linked website is at the user's own risk.\n\n7. Modifications\n\nToxnews may revise these terms of service for its app at any time without notice. By using Toxnews you are agreeing to be bound by the then current version of these terms of service.\n\n8. Governing Law\n\nThese terms and conditions are governed by and construed in accordance with the laws of Burkina and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.\nTerms of Use created with GetTerms.\n `
  String get textTermsText {
    return Intl.message(
      '\nToxnews Terms of Service\n\n1. Terms\n\nBy accessing our app, Toxnews, you are agreeing to be bound by these terms of service, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing Toxnews. The materials contained in Toxnews are protected by applicable copyright and trademark law.\n\n2. Use License\n\n\nPermission is granted to temporarily download one copy of Toxnews per device for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:\n\nmodify or copy the materials;\n\nuse the materials for any commercial purpose, or for any public display (commercial or non-commercial);\nattempt to decompile or reverse engineer any software contained in Toxnews;\nremove any copyright or other proprietary notations from the materials; or\ntransfer the materials to another person or "mirror" the materials on any other server.\n\n\nThis license shall automatically terminate if you violate any of these restrictions and may be terminated by Toxnews at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.\n\n3. Disclaimer\n\nThe materials within Toxnews are provided on an \'as is\' basis. Toxnews makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.\nFurther, Toxnews does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its website or otherwise relating to such materials or on any sites linked to Toxnews.\n\n4. Limitations\n\nIn no event shall Toxnews or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use Toxnews, even if Toxnews or a Toxnews authorised representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.\n\n5. Accuracy of materials\n\nThe materials appearing in Toxnews could include technical, typographical, or photographic errors. Toxnews does not warrant that any of the materials on Toxnews are accurate, complete or current. Toxnews may make changes to the materials contained in Toxnews at any time without notice. However Toxnews does not make any commitment to update the materials.\n\n6. Links\n\nToxnews has not reviewed all of the sites linked to its app and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Toxnews of the site. Use of any such linked website is at the user\'s own risk.\n\n7. Modifications\n\nToxnews may revise these terms of service for its app at any time without notice. By using Toxnews you are agreeing to be bound by the then current version of these terms of service.\n\n8. Governing Law\n\nThese terms and conditions are governed by and construed in accordance with the laws of Burkina and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.\nTerms of Use created with GetTerms.\n ',
      name: 'textTermsText',
      desc: '',
      args: [],
    );
  }

  /// `and `
  String get textAnd {
    return Intl.message(
      'and ',
      name: 'textAnd',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `\nPrivacy Policy\n\nYour privacy is important to us. It is Toxnews' policy to respect your privacy regarding any information we may collect from you through our app, Toxnews.\nWe only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.\nWe only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorised access, disclosure, copying, use or modification.\nWe don’t share any personally identifying information publicly or with third-parties, except when required to by law.\nOur app may link to external sites that are not operated by us. Please be aware that we have no control over the content and practices of these sites, and cannot accept responsibility or liability for their respective privacy policies.\nYou are free to refuse our request for your personal information, with the understanding that we may be unable to provide you with some of your desired services.\nYour continued use of our app will be regarded as acceptance of our practices around privacy and personal information. If you have any questions about how we handle user data and personal information, feel free to contact us.\nThis policy is effective as of 25 December 2020.\nPrivacy Policy created with GetTerms. `
  String get privacyText {
    return Intl.message(
      '\nPrivacy Policy\n\nYour privacy is important to us. It is Toxnews\' policy to respect your privacy regarding any information we may collect from you through our app, Toxnews.\nWe only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.\nWe only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorised access, disclosure, copying, use or modification.\nWe don’t share any personally identifying information publicly or with third-parties, except when required to by law.\nOur app may link to external sites that are not operated by us. Please be aware that we have no control over the content and practices of these sites, and cannot accept responsibility or liability for their respective privacy policies.\nYou are free to refuse our request for your personal information, with the understanding that we may be unable to provide you with some of your desired services.\nYour continued use of our app will be regarded as acceptance of our practices around privacy and personal information. If you have any questions about how we handle user data and personal information, feel free to contact us.\nThis policy is effective as of 25 December 2020.\nPrivacy Policy created with GetTerms. ',
      name: 'privacyText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}