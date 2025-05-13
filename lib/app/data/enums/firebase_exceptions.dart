// Authentication errors
enum FirebaseAuthError {
  emailAlreadyExists('auth/email-already-in-use'),
  userNotFound('auth/user-not-found'),
  wrongPassword('auth/wrong-password'),
  weakPassword('auth/weak-password'),
  tooManyRequests('auth/too-many-requests'),
  invalidCredential('auth/invalid-credential'),
  operationNotAllowed('auth/operation-not-allowed'),
  accountExistsWithDifferentCredential(
    'auth/account-exists-with-different-credential',
  );

  const FirebaseAuthError(this.code);
  final String code;

  String get msg =>
      _firebaseErrorMessages[code] ?? _firebaseErrorMessages['default']!;

  static FirebaseAuthError? fromCode(String code) {
    code = 'auth/$code';
    for (FirebaseAuthError value in FirebaseAuthError.values) {
      if (value.code == code) {
        return value;
      }
    }
    return null;
  }
}

// Token errors
enum FirebaseTokenErrorCode {
  idTokenExpired('auth/id-token-expired'),
  idTokenRevoked('auth/id-token-revoked'),
  sessionCookieExpired('auth/session-cookie-expired'),
  invalidIdToken('auth/invalid-id-token');

  const FirebaseTokenErrorCode(this.code);
  final String code;

  String get msg =>
      _firebaseErrorMessages[code] ?? _firebaseErrorMessages['default']!;

  static FirebaseTokenErrorCode? fromCode(String code) {
    for (FirebaseTokenErrorCode value in FirebaseTokenErrorCode.values) {
      if (value.code == code) {
        return value;
      }
    }
    return null;
  }
}

// User management errors
enum FirebaseUserManagementErrorCode {
  phoneNumberAlreadyExists('auth/phone-number-already-exists'),
  uidAlreadyExists('auth/uid-already-exists'),
  invalidDisplayName('auth/invalid-display-name'),
  invalidPhotoUrl('auth/invalid-photo-url');

  const FirebaseUserManagementErrorCode(this.code);
  final String code;

  String get msg =>
      _firebaseErrorMessages[code] ?? _firebaseErrorMessages['default']!;

  static FirebaseUserManagementErrorCode? fromCode(String code) {
    for (FirebaseUserManagementErrorCode value
        in FirebaseUserManagementErrorCode.values) {
      if (value.code == code) {
        return value;
      }
    }
    return null;
  }
}

// System/configuration errors
enum FirebaseSystemErrorCode {
  insufficientPermission('auth/insufficient-permission'),
  internalError('auth/internal-error'),
  invalidCredential('auth/invalid-credential'),
  projectNotFound('auth/project-not-found');

  const FirebaseSystemErrorCode(this.code);
  final String code;

  String get msg =>
      _firebaseErrorMessages[code] ?? _firebaseErrorMessages['default']!;

  static FirebaseSystemErrorCode? fromCode(String code) {
    for (FirebaseSystemErrorCode value in FirebaseSystemErrorCode.values) {
      if (value.code == code) {
        return value;
      }
    }
    return null;
  }
}

// Custom claims/security errors
enum FirebaseCustomClaimsErrorCode {
  claimsTooLarge('auth/claims-too-large'),
  reservedClaims('auth/reserved-claims');

  const FirebaseCustomClaimsErrorCode(this.code);
  final String code;

  String get msg =>
      _firebaseErrorMessages[code] ?? _firebaseErrorMessages['default']!;

  static FirebaseCustomClaimsErrorCode? fromCode(String code) {
    for (FirebaseCustomClaimsErrorCode value
        in FirebaseCustomClaimsErrorCode.values) {
      if (value.code == code) {
        return value;
      }
    }
    return null;
  }
}

// API usage errors
enum FirebaseApiUsageErrorCode {
  invalidArgument('auth/invalid-argument'),
  invalidUid('auth/invalid-uid'),
  missingUid('auth/missing-uid');

  const FirebaseApiUsageErrorCode(this.code);
  final String code;

  String get msg =>
      _firebaseErrorMessages[code] ?? _firebaseErrorMessages['default']!;

  static FirebaseApiUsageErrorCode? fromCode(String code) {
    for (FirebaseApiUsageErrorCode value in FirebaseApiUsageErrorCode.values) {
      if (value.code == code) {
        return value;
      }
    }
    return null;
  }
}

const _firebaseErrorMessages = {
  // Authentication errors
  'auth/email-already-in-use':
      'This email is already registered. Please use a different email or try signing in.',
  'auth/user-not-found':
      'Account not found. Please check your credentials or sign up.',
  'auth/wrong-password':
      'Incorrect password. Please try again or reset your password.',
  'auth/invalid-email': 'Please enter a valid email address.',
  'auth/invalid-password': 'Password must be at least 6 characters long.',
  'auth/weak-password': 'Please choose a stronger password.',
  'auth/too-many-requests': 'Too many attempts. Please try again later.',
  'auth/operation-not-allowed': 'This sign-in method is currently disabled.',
  'auth/account-exists-with-different-credential':
      'An account already exists with this email but different sign-in method.',

  // Token errors
  'auth/id-token-expired': 'Your session has expired. Please sign in again.',
  'auth/id-token-revoked': 'Your session was revoked. Please sign in again.',
  'auth/session-cookie-expired':
      'Your session has expired. Please sign in again.',
  'auth/invalid-id-token': 'Invalid session token. Please sign in again.',

  // User management errors
  'auth/phone-number-already-exists':
      'This phone number is already registered.',
  'auth/uid-already-exists': 'User ID already exists in our system.',
  'auth/invalid-display-name': 'Please enter a valid name.',
  'auth/invalid-photo-url': 'The profile photo URL is invalid.',

  // System/configuration errors
  'auth/insufficient-permission':
      'System error: Insufficient permissions. Please contact support.',
  'auth/internal-error': 'An unexpected error occurred. Please try again.',
  'auth/invalid-credential':
      'Please chec your email and password and try again.',
  'auth/project-not-found':
      'System configuration error. Please contact support.',

  // Custom claims/security
  'auth/claims-too-large':
      'System error: User permissions too complex. Please contact support.',
  'auth/reserved-claims':
      'System error: Reserved permissions used. Please contact support.',

  // API usage errors
  'auth/invalid-argument': 'System error: Invalid request. Please try again.',
  'auth/invalid-uid':
      'System error: Invalid user reference. Please contact support.',
  'auth/missing-uid':
      'System error: Missing user reference. Please contact support.',

  // Default fallback
  'default':
      'An unexpected error occurred. Please try again or contact support if the problem persists.',
};
