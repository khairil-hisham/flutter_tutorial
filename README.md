# flutter_tutorial

A new Flutter project.

A few resources:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

[online documentation](https://docs.flutter.dev/)

# Before working on this project!

Set git pre-push hook so that it runs 'flutter run' before pushing:
1 - navigate to .git/hooks/
2 - create a script file named 'pre-push' (without any extension)
3 - paste this script in the file:
```
 #!/bin/bash
echo "🔍 Running Flutter tests before push..."
flutter test
if [ $? -ne 0 ]; then
  echo "❌ Tests failed. Push aborted."
  exit 1
fi
echo "✅ All tests passed. Proceeding with push..."
```