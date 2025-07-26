# Turbo

Turbo is an umbrella term for several different techniques foe creating fast and modern apps on Rails. The most core technique is called Turbo Drive. 

## Turbo Drive

Turbo Drive accelerates page navigation; it is how Rails handles forms and links. 

Turbo Drive watches for when a user clicks a link or submits a form, handles the request being made by the user, and then updates the page for the user without a full reload.

### Page Navigation

Turbo Drive defines page navigation as a visit to a url with an action. A visit begins when a user clicks a nav link and ends when the new page is rendered, including any HTTP request, updating browsing history, etc. 

There are two types of visits:
- Application visit, with a Drive action of *advance* or *replace* (nav link)
- Restoration visit, with a Drive action of *restore* (back/forward)
