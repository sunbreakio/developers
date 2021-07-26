# Building Audiences

Sunbreak Personalization works by creating audiences, and then creating different versions of blocks on a per audience basis. We’ll explain more as we go. WE’ll start by creating a simple audience, then show how to use personalized blocks with the new audience.

You can use demographic, behavioral, or contextual data. As long as it’s available in your existing business platforms or the browser, then it’s accessible in WordPress.

Examples include the following:

• Target by city, state, or country if you cater to national or worldwide customers.

• Zero-in on device type, date, time, or referrer if your site has more visitors during a rush period.

• Go deep into the data with job title, company name, lead source, industry, email address, coupon code, and more, by synchronizing with your sales and marketing software.

## Create an Audience

1. Open the audience builder. The icon to open this is shown in both the Personalized block menu and in the top right corner of the WordPress editor.
From the Personalized block:
Top right corner of page / post editor:

1. This presents a new panel, listing the audiences. The first time you use this the list will be empty. To create a new audience, click on “+ Add New Audience”.

1. You will now see the audience editor. It is easy to use.

1. The audience name is free text, you can call it anything you like. It’s sensible to choose a name that matches the audience you are creating.
Select the characteristic you want to use. There are many choices, see later for more information on characteristics. A good place to start is choosing country code.
1. The select relationship drop down varies with the type of characteristic. For country code, the default choice is “is”, which is the correct one. The other options are for numeric or text-based characteristics.
1. Finally, select the country code for where you live. This will allow you to test it readily.
1. You should end up with something like this:

1. Note that it is possible to combine characteristics with either AND or OR. An example might be the country codes for both the US or Canada.

## Characteristics

| Characteristic | Description | Example |
|---|---|---|
| Country Code | This is used to build an audience for a specific country. | US or GB |
| Country Name | Similar to the country code above, but uses the country name instead of the code.  | United States |
| Region / State | This characteristic is for a specific region or state.  | Texas |
| City | This is for a particular city.  | Paris |
| Zip Code | This is for a particular zip code or postal code | 10001 |
| Device Type | This detects the type of device being used to view the website. Very useful for mobile users. | Mobile or Desktop |
| Referrer | This is the URL of the previous website the visitor was on.  | https://google.com |
| Date & Time | This pinpoints a specific time and date. This is useful for starting a sale or promotion. Remember there are options for how to use a characteristic, so could be after a certain date and time.   | 01/01/2021 00:00:00 |
| Time | This characteristic is for a certain time. Maybe the content is different before or after lunch? | 12:00:00 |
| Day of Week | This selects a particular day of the week.  | Wednesday |
| Logged in User | Detects whether or not a user is logged in.This isn’t just admin, but any user of any type. | Yes / No |
| Browser Language | Detects the language the visitor’s device is using. It’s not always English! | French |
| New Visitor | Detects whether or not this is the first time the visitor has been to this website. | Yes / No |
| Visited Page | This characteristic detects if a user has visited a certain page. Remember an audience can use AND or OR to build richer segments. Note, it uses the slug for the page, not the full URL! | about-us |
| Query String | This is incredibly powerful. It can be used to match any parameters passed in via the  URL. Think of UTM codes or social media campaigns like Facebook clickIDs. | Fbclid or UTM code |
