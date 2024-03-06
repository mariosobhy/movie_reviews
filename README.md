# Movie Reviews Rails Application

This is a simple Ruby on Rails application for managing movie reviews. Users can view a list of movies, search for movies by actor, and see the average review stars for each movie.

## Installation

Follow these steps to set up and run the application locally:

1. **Clone the Repository**: 
   ```bash
   git clone https://github.com/mariosobhy/movie_reviews
   cd movie_reviews
   ```

2. **Install Dependencies**:
   ```bash
   bundle install
   ```

3. **Set Up the Database**:
   - Make sure you have PostgreSQL installed and running on your machine.
   - Update the `config/database.yml` file with your PostgreSQL username and password.
   - Create and migrate the database:
     ```bash
     rails db:create
     rails db:migrate
     ```

4. **Import Sample Data** (Optional):
   - If you have sample CSV files for movies and reviews, place them in the `csv` directory.
   - Run the import task to import data from the CSV files:
     ```bash
     rails import:movies_and_reviews
     ```

5. **Start the Server**:
   ```bash
   rails server
   ```

6. **Run the Specs**:
   ```bash
   bundle exec rspec
   ```

7. **Access the Application**:
   Visit `http://localhost:3000` in your web browser to access the application.

## Usage

- **View Movies**: 
  - Visit the homepage to see a list of movies along with their details and average review stars.
- **Search Movies by Actor**:
  - Use the search form on the homepage to search for movies by actor.
- **Add Reviews**:
  - Currently, the application does not support adding reviews via the interface. Reviews can be imported from CSV files or added manually to the database.

## Contributing

Contributions are welcome! If you find any bugs or have suggestions for improvement, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
