# Specktro's Resume Application

This is a simple application to show the specktro's resume as a table view with coordinators architecture (I used just one coordinator for this example).

## Summary
The application uses a flow coordinators architecture to separate the view and the logic, it was created as a singleton to get the information’s network and the structures used as models are Codable types.

## Instructions
There is an enumeration called ```ProfileURL```, you can use it in the ```getProfile``` method to test different JSON responses, feel free to experiment inside the unit test methods to check their failure cases.

For example, inside the ```testProfileSections```  method if you call the ```QueryAPI``` method to get the user profile in this way ```QueryAPI.shared.getProfile(ProfileURL.noSections, fail: failClosure, completion: successClosure)``` the test is going to fail.

Clone it and have fun!

_@specktro - ©2019_
