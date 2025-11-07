# flutter_tutorial

A new Flutter project.

A few resources:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

[online documentation](https://docs.flutter.dev/)

# Before working on this project!
### you need
- git
- flutter
- vscode

<img width="344" height="287" alt="image" src="https://github.com/user-attachments/assets/d846df48-f21b-41d0-a0c1-dfac78f0c315" />

If you want to work on this project you can't just download as zip as that would only provide a snapshot of the project.
You need to clone it using git

> git clone http://github.com/khairil-hisham/flutter_tutorial

After that make sure you are able to build the flutter app. These commands are needed to run for first time build so that libraries are installed

> flutter pub get
>
> flutter run

<hr>

### hook that makes sure you don't push broken project

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

# Single Branch Workflow

After you made edits and want to save it on github follow these steps:

1. stage and commit all files using the command:

> git add .
> 
> git commit -m "your message here"
<br>

2. pull any changes fromn github that someone else might have made to the main branch

> git pull --rebase

- you might encounter a merge conflict, meaning someone else edited the same code as you therefore you
need to decide which version to use by deleting one of the changes highligthed in th file. After that you must
stage everything again and continue the rebase command:

> git add .
> 
> git rebase --continue

- if you decide to undo all the changes you've made, you can revert back to the last time you commit a change (assuming you have not staged any file
which in that case you need to use another command: 'git reset --hard HEAD')

> git restore .
<br>

3. push the branch to github using this command. Make sure you get this message "✅ All tests passed. Proceeding with push..." otherwise
it means that your changes have caused error and you need to fix it before redoing these steps again

> git push
