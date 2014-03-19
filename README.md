#Partly Sunny

Partly Sunny is a crowd-sourced weather site with social features, modeled on [Weather Underground](http://www.wunderground.com). Anyone can submit a weather report, just by looking at a thermometer and looking at the sky. Then, use the Weather Photos feature share your weather photos with friends.

##Cool Features

- Geocoded weather reports & photos.
- Current city weather conditions & photos retrieved dynamically with a custom SQL query.
	- Each photo and report is associated upon creation with zip code.
	- Current conditions for a zip code are calculated by getting the zip code's latitude and longitude, and then retrieving all recent reports from within 0.2 degrees.
	- This lets the site predict weather conditions even for a zip code with no reports of its own, by averaging nearby reports.
- Weather reports are uploaded via AJAX & UJS, so it's super easy to submit a report.
- FileReader makes the photo upload form easier to use.
	- JavaScript's FileReader to display a preview as soon as the user chooses a photo.
	- The user doesn't have to wait for an upload to see what the results will look like, even though the photo is sent up via a normal HTTP request.
- Chart.js chart summarizing most commonly reported weather conditions.
	- Chart scales and dimensions are recalculated and tailored for the current dataset.
- Photo gallery view is super-DRY.
	- It uses a single view & controller action accessible by three separate routes, each nested under a different resource.
	- View photos by user, city, or tag.
- Tags are like text.
	- The user creates tags by typing a comma-separated list into a text field on the photo upload form.
	- The controller find-or-creates Tag objects for each tag the user entered.
	- Before rendering the photo edit form, the controller builds a new string out of the photo's tags, so the user can once again interact with the tags as text.

##Expansion Plans
The moon! But first...

#####Site Maintenance
- [x] new readme
- [x] guest login

#####Weather
- [ ] Use the `friendly_id` gem to make `/zip_codes/10003` -style routes.
	- i.e., routes with real zip codes, rather than database IDs.
- [ ] Add forecast to city show pages.
	- Use National Weather Service API.
- [ ] Replace the city show page with Backbone for continuous updates.
- [ ] Change temperature scale property to use session.
	- Currently uses a `celsius` boolean column in `users` table, so celsius is only usable when logged in.
		- Right now, any page that uses temperatures calls `convert_to_c` function if `current_user.celsius?`.
	- Replace that with `if session[:celsius]`. Then, update `session[:celsius]` on login.
	- Visitors can use the temperature scale toggle in the tools dropdown menu to set `session[:celsius]`.
		- Will need a new route for this and a toggle button that will submit an AJAX request to the route.
		- The route should also update the `celsius` database column if the user is logged in.

#####Photo Gallery
- [ ] Infinite scroll on photo galleries (& dashboard).
- [ ] Make comments box grow when you click it.

#####Users
- [x] Fix Twitter login in production environment.
- [ ] Add password reset emails.
- [ ] Add activation email to users.
- [ ] Add notifications feature.
	- Users should recieve notifications any time a photo gets a comment or a like.
	- Could also do notifications any time a photo is added to a user's favorite zip code.

#####Photos
- [ ] Add photo likes feature.
