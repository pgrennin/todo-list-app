# nextcapital-todo-list-challenge-patrick


### Overview
In this assignment I created a to-do list web application that integrates with a [RESTful JSON api](http://recruiting-api.nextcapital.com).  This application is completely asynchronous and runs on a single-page using AJAX and JQuery.  All requirements were completed as well as integration tests for each requirement.  Full instructions of the assignment are located [here](http://recruiting-api.nextcapital.com/).


### Application Link
  - [https://todo-list-app-patrick-grenning.herokuapp.com/](https://todo-list-app-patrick-grenning.herokuapp.com/)

### Requirements
  - [x] Sign up user
  - [x] Log in user
  - [x] See a list of all the todos for user
  - [x] Create new todos for user
  - [x] Edit a todo description
  - [x] Mark todos as complete or incomplete for user
  - [x] Reorder their todos (this is just client-side) for user.

### Testing
Tests were created in Rspec for all the requirements listed above.

To run all the rspec tests from the terminal enter the following:

```$ bin/rspec ```

OR for more detailed output of test results use:

```$ bin/rspec --format d ```


###Technologies Used in this App
  - **Ruby on Rails** as the web application framework
  - **Bootstrap** for front-end user interface components
  - **Rest-Client** gem for sending http requests.
  - **AJAX/ Jquery** for an asynchronous user experience
  - **Jquery UI** to achive drag and drop reordering of todo items.
  - **Rspec and Faker** for integration and controller testing.
