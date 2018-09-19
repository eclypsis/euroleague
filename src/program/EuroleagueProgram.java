package program;

import dao.PlayerDao;
import dao.TeamDao;
import model.Player;
import model.Team;

import java.util.Scanner;

/**
 * Created by xzinoviou
 * 19/9/2018
 */
public class EuroleagueProgram {

    public static void main(String[] args){

        Scanner scanner = new Scanner(System.in);
        PlayerDao playerDao = new PlayerDao();
        TeamDao teamDao = new TeamDao();


        while(true){

            System.out.println("**************************");
            System.out.println("MENU");
            System.out.println("1. Add Player");
            System.out.println("2. Add Team");
            System.out.println("3. Find Player by name");
            System.out.println("4. Find Player by team");
            System.out.println("5. Find Team by name");
            System.out.println("6. Statistics");
            System.out.println("7. Update Player");
            System.out.println("8. Update Team");
            System.out.println("9. Exit");


            System.out.println("**************************");


            System.out.println("Enter choice : ");

            String choiceInput = scanner.nextLine();

            Byte choice = choiceInput.getBytes()[0];

            switch(choice){

                case '1':

                    Player player = new Player();
                    System.out.println("Enter Player id : ");
                    String playerId = scanner.nextLine();
                    System.out.println("Enter Player First Name : ");
                    String firstName = scanner.nextLine();
                    System.out.println("Enter Player Last Name : ");
                    String lastName = scanner.nextLine();
                    System.out.println("Enter Player Age : ");
                    Integer age = Integer.parseInt(scanner.nextLine());

                    player.setId(playerId);
                    player.setFirstName(firstName);
                    player.setLastName(lastName);
                    player.setAge(age);

                    playerDao.addPlayer(player);
                    System.out.println("Player with id : " + playerId + " was succesfully added to db");
                    break;

                case '2':
                    Team team = new Team();
                    System.out.println("Enter Team id : ");
                    String teamId = scanner.nextLine();
                    System.out.println("Enter Team name : ");
                    String teamName = scanner.nextLine();
                    System.out.println("Enter year of creation : ");
                    Integer yearOfCreation = Integer.parseInt(scanner.nextLine());
                    System.out.println("Enter owner : ");
                    String owner = scanner.nextLine();

                    team.setId(teamId);
                    team.setName(teamName);
                    team.setYear(yearOfCreation);
                    team.setOwner(owner);

                    teamDao.addTeam(team);
                    System.out.println("Team with id : " + teamId + " was succesfully added to db");
                    break;



                    case '3':
                        System.out.println("Enter Player Last Name : ");
                        lastName = scanner.nextLine();

                        player = playerDao.getPlayerByName(lastName);

                        System.out.println(player.toString());
                    break;

                case '4':
                    /**
                     * TODO:player by team
                     */

                    break;

                case'5':
                    System.out.println("Enter Team Name : ");
                    teamName = scanner.nextLine();

                    team = teamDao.getTeamByName(teamName);

                    System.out.println(team.toString());
                    break;

                case '6':
                    /**
                     * TODO:statistics
                     */
                    break;

                case '7':
                    player = new Player();
                    System.out.println("Enter Player id : ");
                    playerId = scanner.nextLine();
                    System.out.println("Enter Player First Name : ");
                    firstName = scanner.nextLine();
                    System.out.println("Enter Player Last Name : ");
                    lastName = scanner.nextLine();
                    System.out.println("Enter Player Age : ");
                    age = Integer.parseInt(scanner.nextLine());


                    player.setId(playerId);
                    player.setFirstName(firstName);
                    player.setLastName(lastName);
                    player.setAge(age);

                    playerDao.updatePlayer(player);

                    break;

                case 8:
                    team = new Team();
                    System.out.println("Enter Team id : ");
                    teamId = scanner.nextLine();
                    System.out.println("Enter Team name : ");
                    teamName = scanner.nextLine();
                    System.out.println("Enter year of creation : ");
                    yearOfCreation = Integer.parseInt(scanner.nextLine());
                    System.out.println("Enter owner : ");
                    owner = scanner.nextLine();

                    team.setId(teamId);
                    team.setName(teamName);
                    team.setYear(yearOfCreation);
                    team.setOwner(owner);

                    teamDao.updateTeam(team);
                    break;

                case '9':
                    System.exit(1);

                default:
                    System.out.println("Invalid choice!");
                    break;
            }
        }

    }

}
