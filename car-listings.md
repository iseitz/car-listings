### Introduction

You have been tasked with creating an application that manages cars for a used car lot.

### Getting Set Up

Run the following commands to set up your rails app.

```no-highlight
$ et get car-listings
$ cd car-listings
$ bundle
$ rake db:create
```

### Requirements Necessary to Meet Expectations

Test drive your development by passing the provided model and acceptance tests
for the following user stories and getting the tests to pass to complete the
acceptance criteria for each feature.

```no-highlight
  As a car salesperson
  I want to see a list of manufacturers
  So that I can see what types of cars are available
```

Acceptance Criteria:

* Visiting the manufacturers_path should show a list of manufacturers
* I can visit this link from any page of the application

```no-highlight
  As a car salesperson
  I want to see a list of cars
  So that I can see what cars are available
```

Acceptance Criteria:

* Visiting the cars_path should show a list of cars
* I can visit this link from any page of the application

```no-highlight
As a car salesperson
I want to record a car manufacturer
So that I can keep track of the types of cars found in the lot
```

Acceptance Criteria:

* I must specify a manufacturer name and country.
* If I do not specify the required information, I am presented with errors.
* If I specify the required information, the manufacturer is recorded and I am
redirected to the index of manufacturers

```no-highlight
As a car salesperson
I want to record a newly acquired car
So that I can list it in my lot
```

Acceptance Criteria:

* I must specify the manufacturer, color, year, and mileage of the car (an
  association between the car and an existing manufacturer should be created).
* Only years from 1920 and above can be specified.
* I can optionally specify a description of the car.
* If I enter all of the required information in the required formats, the car is
recorded and I am presented with a notification of success.
* If I do not specify all of the required information in the required formats, the
car is not recorded and I am presented with errors.
* Upon successfully creating a car, I am redirected back to the index of cars.

### Tips

* User authentication is **not** required for this application.
* Utilizing nested routes is not necessary for this application. **Do not** nest
cars under manufacturers.
* Make sure your tests pass.
* Make sure that your app is usable by providing links to navigate between the
different pages.
* Make sure that your database schema has the necessary constraints.
* Make sure that your models contain the necessary validations and associations.

### Requirements necessary to Exceed Expectations

Write tests for the following user stories and the code to make them pass.

```no-highlight
As a car buyer
I want to search for specific cars
So that I can look at the cars that I am interested in
```

Acceptance Criteria:

* There is a search form for cars on the cars index.
* I can specify the manufacturer, color, year, and a max mileage of a car in the form.
* The manufacturers that can be selected should be the ones shown on the manufacturer index page.
* There should be a dropdown with the colors of all the cars. There should be no duplicate color options. If a new car with a new color is added via the form, the dropdown should update to include the color.
* There should be a dropdown with the years of all the cars. There should be no duplicate year options and they should be ordered form most newest to oldest. If a new car with a new year is added via the form, the dropdown should update to include the year.
* There should be a dropdown with the max mileages of the cars. The options should be 'N/A', '1000', '10,000', '100,000'. Selecting 'N/A' should not take mileage into account. Selecting a mileage should filter for cars with mileage less than or equal to the selected mileage.
* If I submit the form without specifying anything, I should see the full car index.
* If I submit the form with certain specifications, I should only see cars that fit those specifications.

```no-highlight
As a used car salesperson
I would like to see the condition of a car
So that I know how desirable it is to the buyer.
```

The following table describes the condition of cars based on their year and mileage

| Year | Mileage | Condition |
| ---- | ------- | --------- |
| 2016 | 900     | Excellent |
| 2016 | 1000    | Good      |
| 2015 | 900     | Good      |
| 2015 | 50,000  | Fair      |
| 2011 | 900     | Fair      |
| 2011 | 50,000  | Poor      |

* Implement a method on the car class that returns the condition of a vehicle, based on the age and mileage. It is up to you to determine _how_ to implement this method, but it should return the condition listed for these sample inputs for year and mileage. The method must have a corresponding unit test.
* Once this method is working correctly, make sure you display the condition of the car on the car index page.
