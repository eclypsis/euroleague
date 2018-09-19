package dao;

import model.Team;
import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by xzinoviou
 * 19/9/2018
 */
public class TeamDao {

    private Connection connection;

    public TeamDao(){
        connection = DBUtils.getConnection();
    }

    public void addTeam(Team team){

        try{
            String query = "INSERT INTO team(team_id,name,year_of_creation,owner) " +
                    "VALUES(?, ?, ?, ?)";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1,team.getId());
            preparedStatement.setString(2,team.getName());
            preparedStatement.setInt(3,team.getYear());
            preparedStatement.setString(4,team.getOwner());

            int result = preparedStatement.executeUpdate();

            System.out.println("Added " + result + " row in team table");

        } catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void updateTeam(Team team){

        try{
            String query = "UPDATE team SET name = ?,year_of_creation = ?,owner = ? " +
                    " WHERE team_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1,team.getName());
            preparedStatement.setInt(2,team.getYear());
            preparedStatement.setString(3,team.getOwner());
            preparedStatement.setString(4,team.getId());


            int result = preparedStatement.executeUpdate();

            System.out.println("Added " + result + " row in team table");

        } catch(SQLException e){
            e.printStackTrace();
        }
    }

    public Team getTeamByName(String name){

        Team team = new Team();
        try{
            String query = "SELECT * FROM team WHERE name LIKE ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,"%" + name + "%");

            ResultSet resultSet = preparedStatement.executeQuery();



            while(resultSet.next()){

                team.setId(resultSet.getString(1));
                team.setName(resultSet.getString(2));
                team.setYear(resultSet.getInt(3));
                team.setOwner(resultSet.getString(4));
            }

            resultSet.close();

        } catch(SQLException e){
            e.printStackTrace();
        }


        return team;
    }


}
