package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by xzinoviou
 * 19/9/2018
 */
public class DBUtils {

    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/euroleague_db";
    private static final String USER = "root";
    private static final String PASS = "root";

    private static Connection connection;

    public static Connection getConnection(){
        if(connection != null)
            return connection;

        else{
            try {

                Class.forName(DRIVER);

                connection = DriverManager
                        .getConnection(URL, USER, PASS);

            } catch(ClassNotFoundException e){
                e.printStackTrace();
            }

            catch(SQLException e){
                e.printStackTrace();
            }

            return connection;
        }
    }
}
