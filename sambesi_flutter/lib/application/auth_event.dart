import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final bool redirect;
  LoginEvent({this.redirect = false});
}

class CheckCachedAccountEvent extends AuthenticationEvent {}

class LogoutEvent extends AuthenticationEvent {}
