calabash-android-tescoversion
========================


####Before running tests
	bundle install

####How to run project
 calabash-android run path/to/the/apk LOGIN=username:password --tags @error (Error code validation)
 calabash-android run path/to/the/apk LOGIN=username:password --tags @login (triggers the api calls and gets the user to amend mode and then calabash asserts the state)
              
####Accessing objects from support/env.rb file
	create object for each class in page pattern in the env.rb file
    
