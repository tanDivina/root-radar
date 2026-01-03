# Serverpod Feedback Log - Root Radar Project

This log documents actionable feedback, friction points, and suggestions for the Serverpod team based on the development of the Root Radar app.

## 1. Dependency Management & Version Conflicts
- **Issue**: Conflict between `ar_flutter_plugin` and `google_maps_flutter` regarding the `geolocator` package.
- **Details**: `ar_flutter_plugin` (any) forced an older version of `geolocator` (^9.0.0), while the latest `google_maps_flutter` and general best practices suggested ^13.0.0.
- **Feedback**: It would be helpful if Serverpod's documentation or CLI provided more guidance on resolving transitive dependency conflicts when mixing AR/Map plugins with Serverpod's own dependencies (like `serverpod_flutter` which also manages some storage/auth dependencies).

## 2. Serverpod Cloud CLI (`scloud`)
- **Friction**: The `scloud deploy` command initially failed because the project wasn't "linked" locally, even though the project existed in the cloud.
- **Suggestion**: If `scloud deploy` fails due to a missing link, the error message should proactively suggest `scloud project link <project-id>` if it detects a project with a matching name in the user's account.
- **Friction**: The `scloud deployment list` command requires the `-p` flag even after the project is linked.
- **Suggestion**: Once a project is linked, `scloud` commands should default to the linked project ID to reduce typing.

## 3. FutureCalls & Local Testing
- **Friction**: Testing `FutureCalls` (like our Butler's Morning Briefing) locally requires manual database manipulation or waiting for the timer.
- **Suggestion**: A CLI command like `serverpod trigger-call <callName>` would be invaluable for debugging background tasks without waiting for the schedule.

## 4. Documentation
- **Positive**: The "App Config" pattern (serving `config.json` from the server) is excellent for environment management.
## 5. Web Compatibility & File Uploads
- **Friction**: The `FileUploader.upload` method in `serverpod_flutter` expects a `Stream<ByteData>`, but most Flutter image pickers (like `image_picker`) return `XFile` which provides `Uint8List` via `readAsBytes()`.
- **Suggestion**: Adding a convenience method like `uploader.uploadBytes(Uint8List bytes)` would simplify the most common use case for mobile/web image uploads.
- **Friction**: `dart:io` usage in shared code (like screens) causes immediate compilation failures on web.
- **Suggestion**: More prominent documentation or a "Web Compatibility" section in the Serverpod guide would help developers avoid common pitfalls like using `Platform.isAndroid` or `File` directly in UI code.

## 6. Authentication UI Components
- **Friction**: The `SignInWidget` API can be confusing when trying to enable only specific providers (like Email).
- **Positive**: The dedicated buttons like `SignInWithEmailButton` are much easier to use and style.
- **Suggestion**: The default styling of the "Don't have an account?" text in the email sign-in dialog can sometimes feel out of proportion with the rest of the app's theme. Providing more granular theme properties for these sub-widgets would be beneficial.
