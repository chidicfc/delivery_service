## Getting started

Once you've got this skeleton rails app up and running visit http://localhost:3000 and use the simple UI to create an order. Remember to seed the database first.

## Tasks

1. Add a rake task called "shipping".
   * When this task runs it should take a date
    as an argument and create a "Delivery" object for all the orders going out
    on that date which have a status of "billed".
   * Note that orders for the "3 month bundle" type should have a total of three deliveries, 28 days apart from each other.
   * It should set the status of an order to "complete" when all the deliveries for that order have been created.

2. The "Free shipping" shipping option shouldn't be available to book over bank holidays.
   * Please update the rake task
    to move any deliveries with bank holiday date to the next non-bank holiday date. For example deliveries for 1st January 2020 should be moved to the 2nd January 2020.
   * List of bank holidays - https://www.gov.uk/bank-holidays / https://www.gov.uk/bank-holidays.json.

3. Expose delivery information (recipient name, bouquet name, order ID, shipping option name and price) through a public API endpoint for the mobile apps team to use. While you should consider how the API endpoint would be used by a mobile app, please don't implement any authentication in the API.
   * You are welcome to choose the format / build it yourself or use any gem to solve the problem.


## Discussion

How might you improve the architecture of the code? Specifically what might happen if the application were to die mid way through rake task and what will happen as complexity increases.
