# Secret Diary

This program allows you to store and view diary entries, and also to lock the diary from unauthorised access.

The data is wiped when the program is closed as there is no text file/ CSV file linked.

The commits show my progression of TDD whilst creating this program.

The secret_diary.rb file is PRIOR to encapsulation - It is all in methods, not classes

To run/check all tests are working:
```shell
rspec spec/diary_spec.rb
rspec spec/diary_access_spec.rb
```
OR
```shell
ruby lib/diary.rb
```

To view tests before encapsulation:
```shell
rspec spec/secret_diary_spec.rb
```
