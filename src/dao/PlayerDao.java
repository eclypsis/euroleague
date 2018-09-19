package dao;

import model.Player;
import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by xzinoviou
 * 19/9/2018
 */
public class PlayerDao {

    private Connection connection;

    public PlayerDao(){
        connection = DBUtils.getConnection();
    }

    public void addPlayer(Player player){

        try{
            String query = "INSERT INTO player(player_id,first_name,last_name,age) " +
                    "VALUES(?, ?, ?,?)";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1,player.getId());
            preparedStatement.setString(2,player.getFirstName());
            preparedStatement.setString(3,player.getLastName());
            preparedStatement.setInt(4,player.getAge());

            int result = preparedStatement.executeUpdate();

            System.out.println("Added " + result + " row in player table");

        } catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void updatePlayer(Player player){

        try{
            String query = "UPDATE player SET first_name = ?,last_name = ?,age = ?" +
                    "WHERE played_id = ? ";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1,player.getFirstName());
            preparedStatement.setString(2,player.getLastName());
            preparedStatement.setInt(3,player.getAge());
            preparedStatement.setString(4,player.getId());


            int result = preparedStatement.executeUpdate();

            System.out.println("Updated " + result + " row in player table");

        } catch(SQLException e){
            e.printStackTrace();
        }
    }



    public Player getPlayerByName(String name){

        Player player = new Player();
        try{
            String query = "SELECT * FROM player WHERE last_name LIKE ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,"%" + name + "%");

            ResultSet resultSet = preparedStatement.executeQuery();



            while(resultSet.next()){

                player.setId(resultSet.getString(1));
                player.setFirstName(resultSet.getString(2));
                player.setLastName(resultSet.getString(3));
                player.setAge(resultSet.getInt(4));
            }

            resultSet.close();

        } catch(SQLException e){
            e.printStackTrace();
        }

        return player;
    }

}
