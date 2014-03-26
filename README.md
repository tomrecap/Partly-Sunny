##Partly Sunny

Partly Sunny is a crowd-sourced weather site with social features, modeled on [Weather Underground](http://www.wunderground.com). Anyone can submit a weather report, just by looking at a thermometer and looking at the sky. Then, use the Weather Photos feature share your weather photos with friends.

###Cool Features
- Geocoded weather reports & photos stored in PostgreSQL database.
	- Uses custom SQL queries to find & retrieve nearby reports.
	- Customized to reduce number of queries needed.
  - This lets the site predict weather conditions even for a zip code with no reports of its own, by averaging nearby reports.
- Full suite of tests (see [spec folder](https://github.com/tomrecap/Partly-Sunny/tree/master/spec)).
  - Uses RSpec with factory_girl for unit tests.
- Uses AJAX & UJS to submit weather reports, photo comments, & favorites quickly.
- Integrates with external APIs & libraries.
  - Uses OAuth to allow enable sign-in with Twitter.
  - Uses MapBox to plot recent weather reports.
  - Sources sample data from OpenWeatherMap API.
  - Chart.js used to summarize weather conditions, with scales & dimensions calculated dynamically.
- Photo sharing.
	- Stored in AWS S3 bucket.
	- Uploaded & validated type using Paperclip gem.
	- Upload form uses HTML5's File API to display picture before uploading.
- Photo gallery view is super-DRY.
	- Single view & controller action accessible by 3 routes, each nested under a different resource.
	- View photos by user, city, or tag.
- Trigram & fuzzy string search using `pg-search` gem.

###Expansion Plans
The moon! But first...

#####Site Maintenance
- New readme √
- Guest login √

#####Weather
- Use the `friendly_id` gem to make `/zip_codes/10003` -style routes.
	- i.e., routes with real zip codes, rather than database IDs.
- Add forecast to city show pages.
	- Use National Weather Service API.
- Replace the city show page with Backbone for continuous updates.
- Change temperature scale property to use session.
  - Currently uses a `celsius` boolean column in `users` table, so celsius is only usable when logged in.
    - Right now, any page that uses temperatures calls `convert_to_c` function if `current_user.celsius?`.
    - Replace that with `if session[:celsius]`. Then, update `session[:celsius]` on login.
  - Visitors can use the temperature scale toggle in the tools dropdown menu to set `session[:celsius]`.
    - Will need a new route for this and a toggle button that will submit an AJAX request to the route.
    - The route should also update the `celsius` database column if the user is logged in.

#####Photo Gallery
- Infinite scroll on photo galleries (& dashboard).
- Make comments box grow when you click it.

#####Users
- Fix Twitter login in production environment. √
- Add password reset emails.
- Add activation email to users.
- Add notifications feature.
  - Users should recieve notifications any time a photo gets a comment or a like.
  - Could also do notifications any time a photo is added to a user's favorite zip code.

#####Photos
- Add photo likes feature.
