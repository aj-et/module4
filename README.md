# Overview

On this module, I created a simple recipe database using PostgreSQL.
I created the table and sample recipes in the [module4.sql](./module4.sql).

On the back-end/server-side of this project, there is a swagger documentation that will allow you to test the database endpoints and make changes in the database.

On the front-end/client-side of this project, the user can view, modify, and delete the food recipe.

The purpose of creating this project is to learn more about PostgreSQL and using the data into the client-side of the application.

[Software Demo Video](http://youtube.link.goes.here)

# Relational Database

PostgreSQL is a powerful, open source object-relational database system that uses and extends the SQL language combined with many features that safely store and scale the most complicated data workloads. The origins of PostgreSQL date back to 1986 as part of the POSTGRES project at the University of California at Berkeley and has more than 35 years of active development on the core platform.

I created 3 tables (recipe, ingredient, direction) where both ingredient and direction tables are connected to the recipe table. Both the ingredient and direction has a one to many relationship with the recipe table (one recipe has many ingredient and direction).

# Development Environment

**Technoligies and languages used**
PostgreSQL
JavaScript
Swagger
Render

# Useful Websites

- [PostgreSQL](https://www.postgresql.org/about)
- [JavaScript](https://www.w3schools.com/js)
- [Swagger](https://swagger.io/docs)
- [Render](https://render.com/docs)

# Future Work

- Add a user table that the created recipe will be tied to.
- Add an OAuth for the frontend.
- Make a mobile version of the application.