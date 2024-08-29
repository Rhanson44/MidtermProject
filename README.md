# MidtermProject



## Overview
* Create a full stack application that include the following features:
  * Database Schema that is connected to Java code using JPA
  * C.R.U.D. operations
  * A user login, where users have different levels of permission compared to non users
  * A way to track an individual user's previous experiences on the site

## Team Members
* Rayne Hanson
* Adrian Vidal
* Destinee Kennedy

## How to Run
* As a non-logged in user I can view a list of 12 National Parks and it's features with the option to update:
  * Animals in the park
  * Flora in the park
  * Trails in the park
  * Mountains in the park
  * Points of Interests at the park

* As a logged in user I can add comments to the park's comment section, the park's trails, and the points of interest section.
* As a logged in user my comments are tracked and displayed on my account page, I also have the availability to delete any of my comments.
* As the admin of the page, I can delete any comments.

## Project Structure
* Development Tools
  * GitHub: For version control and collaborative development. All source code and project documentation are hosted here
  * Trello: Used for project management, task tracking, and organizing development sprints
  * Figma: Figma’s collaborative features enable team members to provide feedback directly on the design files, facilitating a streamlined design review and iteration process
    
* Backend
  * Java code and SpringMVC: This layer handles the core application logic, routing, and interacts with the database through JPA (Java Persistence API)
    * DAO (Data Access Object) Layer:
      * DAO Interfaces: Define the standard data access operations for various entities. These interfaces declare methods for CRUD operations and custom queries needed by the application
      * DAO Implementations: Concrete classes that implement the DAO interfaces. They provide the actual code for interacting with the database using JPA or SQL queries. This separation   
allows for easier maintenance and testing.
      * Controllers: Handle HTTP requests and responses. Controllers map URLs to specific methods, process user input, and return views or data. They interact with the service layer to fetch or manipulate data as needed
  * Database schema: Managed using MySQL, with JPA for ORM (Object-Relational Mapping) to facilitate CRUD operations
  * Gradle: Used as the build automation tool to manage project dependencies and build processes
 
* Frontend
  * HTML: Structures the content and layout of web pages
  * CSS: Styles the visual appearance, including layout, colors, and typography, ensuring a responsive design that works well across different devices
 
* Server
  * Tomcat: Acts as the servlet container for deploying and running the Java-based web application
  * MAMP: Provides a local server environment to develop and test the application on a macOS system
 
* Deployment
  * AWS EC2: Used for deploying the application to a cloud server, ensuring scalability and remote access for users

## Technologies Used
* Java
* SpringMVC
* Gradle
* GitHub
* Figma
* Trello
* Mac Terminal CLI
* MySQL
* Tomcat
* MAMP
* AWS Ec2

## Lessons Learned
* Stick to the user stories​
* Test a function works fully before moving on​
* Communication ​
* Implementing Bootstrap/styling elements​
* CRUD operations with multiple tables
