package customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerList implements customerService{
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Tam250399";

    private static final String INSERT_USERS_SQL = "INSERT INTO demo1 VALUES " +
            " (?, ?, ?, ? ,?);";

    private static final String SELECT_USER_BY_ID = "select * from demo1 where id =?";
    private static final String SELECT_ALL_USERS = "select * from demo1";
    private static final String DELETE_USERS_SQL = "delete from demo1 where id = ?;";
    private static final String UPDATE_USERS_SQL = "update demo1 set _name = ?, username = ? ,email= ?, address =? where id = ?;";


    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<person> findAll() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<person> persons = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("_name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String country = rs.getString("address");
                persons.add(new person(id, name,username, email, country));
            }
        } catch (SQLException e) {

        }
        return persons;
    }

    @Override
    public void save(person person) {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setInt(1, person.getId());
            preparedStatement.setString(2, person.getName());
            preparedStatement.setString(3, person.getUsername());
            preparedStatement.setString(4, person.getEmail());
            preparedStatement.setString(5, person.getAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {

        }
    }

    @Override
    public person findById(int id) {
        person person = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("_name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String country = rs.getString("address");
                person = new person(id, name, username, email, country);
            }
        } catch (SQLException e) {

        }
        return person;
    }

    @Override
    public boolean update(int id, person person) {
        boolean rowUpdated = false;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setInt(5, person.getId());
            statement.setString(1, person.getName());
            statement.setString(2, person.getUsername());
            statement.setString(3, person.getEmail());
            statement.setString(4, person.getAddress());
            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public boolean remove(int id) {
            boolean rowDeleted = false;
            try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
                statement.setInt(1, id);
                rowDeleted = statement.executeUpdate() > 0;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            return rowDeleted;
    }
}
