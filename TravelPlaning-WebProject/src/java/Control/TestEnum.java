/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Data.*;

/**
 *
 * @author krankai
 */
public class TestEnum {
    public static void main(String[] args)
    {
        System.out.println("List of types of journey:");
        for (JourneyType type : JourneyType.values())
        {
            System.out.println("# " + type.name() + ": " + type.getListLocationType());
        }
    }
}
