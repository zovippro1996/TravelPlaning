/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import java.util.*;

/**
 *
 * @author user
 */
public class GenerateComment {
    public static void main(String[] args)
    {
        // LocationID for France: 165-292
        String query1 = generateComment(165, 292);
        System.out.println(query1);
    }
    
    private static String generateComment(int startLocationID, int endLocationID)
    {
        Random rand = new Random(System.currentTimeMillis());
        String query = "INSERT INTO Comments (UserID, LocationID, Description, Rate) VALUES\n";
        int[] userID = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
        String comment = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                + "Duis non arcu ligula. Cras pharetra mi eu est porta egestas."
                + "Mauris efficitur nisl in nunc imperdiet, non venenatis diam dictum."
                + "Proin.";
        
        for (int id = startLocationID; id <= endLocationID; ++id)
        {
            for (int i = 0; i < userID.length; ++i)
            {
                int user = userID[i];
                query += "(" + user + ", " + id + ", '" + comment + "', " + (rand.nextInt(10) + 1) / 2.0 + "),\n";
            }
        }
        query = query.substring(0, query.length() - 2) + ";";
        
        return query;
    }
}
