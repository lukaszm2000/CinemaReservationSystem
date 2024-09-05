# Description of the database for the PLSQL and T-SQL project:
The database includes information about the cinema, customers, film ratings, films, film genres, screenings, reservations,
cinema halls, hall types and addresses - all key elements related to the functioning of the cinema.
It allows you to track information about films, their ratings, screenings, where they are shown and customer reservations.

# T-SQL project:
The procedure will enable the cancellation of a given screening from the repertoire (at the latest date
5 days from the current date) if the number of reservations is less than the argument provided by the user. In addition, the user provides
start and end date between which the screening will be searched. Customers' reservations for a given film they have are also canceled
number of reservations below the argument.

The trigger checks whether the entered rating and comment apply to a film that has already premiered in this cinema.
It also checks whether a given customer has not already rated this film.
If the rating and comment is about a film that has not yet premiered, or the customer has already rated this film,
then the changes are rolled back. Additionally, the AverageRating column in the FilmRating table is updated for the film for which it was created
correct comment added.

PLSQL project:
As part of this project, the procedure from the T-SQL project was reproduced - its functionality is almost identical.
