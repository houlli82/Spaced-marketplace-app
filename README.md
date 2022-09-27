# Spaced

This was our marketplace app at Le Wagon.<br><br>
The idea was that space is hard to find and at a premium in Tokyo, so we decided on an app that allows users to search for spaces at a reasonable price that have been uploaded by users who have space available to rent.

<img width="956" alt="Spaced" src="https://user-images.githubusercontent.com/92862939/192516298-047d95a5-30a3-4037-b29f-b2ad04d8fb09.png">

<br>
App home: http://spaced-848.herokuapp.com/
   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```

```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Cloudinary](https://cloudinary.com/) - Image upload
- [Mapbox](https://mapbox.com/) - Map search function
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License
