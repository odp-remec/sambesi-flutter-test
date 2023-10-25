import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final String token;
  AuthenticationSuccess(this.token);
}

class AuthenticationError extends AuthenticationState {
  final String message;
  AuthenticationError(this.message);
}

class AuthenticationLoggedOut extends AuthenticationState {}