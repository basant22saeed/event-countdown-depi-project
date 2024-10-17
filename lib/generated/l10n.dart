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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Event Countdown`
  String get app_name {
    return Intl.message(
      'Event Countdown',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu_button {
    return Intl.message(
      'Menu',
      name: 'menu_button',
      desc: '',
      args: [],
    );
  }

  /// `Profile Picture`
  String get profile_picture {
    return Intl.message(
      'Profile Picture',
      name: 'profile_picture',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Night Mode`
  String get night_mode {
    return Intl.message(
      'Night Mode',
      name: 'night_mode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Ar`
  String get ar_language_label {
    return Intl.message(
      'Ar',
      name: 'ar_language_label',
      desc: '',
      args: [],
    );
  }

  /// `En`
  String get en_language_label {
    return Intl.message(
      'En',
      name: 'en_language_label',
      desc: '',
      args: [],
    );
  }

  /// `Add Event`
  String get add_event {
    return Intl.message(
      'Add Event',
      name: 'add_event',
      desc: '',
      args: [],
    );
  }

  /// `What is the event about?`
  String get event_hint_text {
    return Intl.message(
      'What is the event about?',
      name: 'event_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `What is the Event Title?`
  String get event_title {
    return Intl.message(
      'What is the Event Title?',
      name: 'event_title',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get Date {
    return Intl.message(
      'Date',
      name: 'Date',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get Time {
    return Intl.message(
      'Time',
      name: 'Time',
      desc: '',
      args: [],
    );
  }

  /// `No Date Selected`
  String get event_date_initial_value {
    return Intl.message(
      'No Date Selected',
      name: 'event_date_initial_value',
      desc: '',
      args: [],
    );
  }

  /// `No Time Selected`
  String get event_time_initial_value {
    return Intl.message(
      'No Time Selected',
      name: 'event_time_initial_value',
      desc: '',
      args: [],
    );
  }

  /// `No Icon Selected`
  String get event_icon_initial_value {
    return Intl.message(
      'No Icon Selected',
      name: 'event_icon_initial_value',
      desc: '',
      args: [],
    );
  }

  /// `No Color Selected`
  String get event_color_initial_value {
    return Intl.message(
      'No Color Selected',
      name: 'event_color_initial_value',
      desc: '',
      args: [],
    );
  }

  /// `Set Date`
  String get date_picker {
    return Intl.message(
      'Set Date',
      name: 'date_picker',
      desc: '',
      args: [],
    );
  }

  /// `Set Time`
  String get time_picker {
    return Intl.message(
      'Set Time',
      name: 'time_picker',
      desc: '',
      args: [],
    );
  }

  /// `Icon`
  String get Icon {
    return Intl.message(
      'Icon',
      name: 'Icon',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get Color {
    return Intl.message(
      'Color',
      name: 'Color',
      desc: '',
      args: [],
    );
  }

  /// `Choose Icon`
  String get choose_icon {
    return Intl.message(
      'Choose Icon',
      name: 'choose_icon',
      desc: '',
      args: [],
    );
  }

  /// `Choose Color`
  String get choose_color {
    return Intl.message(
      'Choose Color',
      name: 'choose_color',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes_title {
    return Intl.message(
      'Notes',
      name: 'notes_title',
      desc: '',
      args: [],
    );
  }

  /// `Describe the event`
  String get notes_hint_text {
    return Intl.message(
      'Describe the event',
      name: 'notes_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save_button {
    return Intl.message(
      'Save',
      name: 'save_button',
      desc: '',
      args: [],
    );
  }

  /// `Event Details`
  String get event_details {
    return Intl.message(
      'Event Details',
      name: 'event_details',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this event?`
  String get delete_event_confirmation {
    return Intl.message(
      'Are you sure you want to delete this event?',
      name: 'delete_event_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get Days {
    return Intl.message(
      'Days',
      name: 'Days',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get Hours {
    return Intl.message(
      'Hours',
      name: 'Hours',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get Minutes {
    return Intl.message(
      'Minutes',
      name: 'Minutes',
      desc: '',
      args: [],
    );
  }

  /// `Seconds`
  String get Seconds {
    return Intl.message(
      'Seconds',
      name: 'Seconds',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit {
    return Intl.message(
      'Edit',
      name: 'Edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Event`
  String get edit_event {
    return Intl.message(
      'Edit Event',
      name: 'edit_event',
      desc: '',
      args: [],
    );
  }

  /// `Edit Event Details`
  String get edit_event_details {
    return Intl.message(
      'Edit Event Details',
      name: 'edit_event_details',
      desc: '',
      args: [],
    );
  }

  /// `'Event updated successfully!'`
  String get event_edited_snackbar {
    return Intl.message(
      '\'Event updated successfully!\'',
      name: 'event_edited_snackbar',
      desc: '',
      args: [],
    );
  }

  /// `Event deleted successfully!`
  String get event_deleted_snackbar {
    return Intl.message(
      'Event deleted successfully!',
      name: 'event_deleted_snackbar',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
