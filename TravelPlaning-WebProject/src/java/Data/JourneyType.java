/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import java.util.*;

/**
 *
 * @author krankai
 */
public enum JourneyType
{
    SIGHTSEEING(new LocationType[] {LocationType.CULTURAL, LocationType.LANDMARK,
        LocationType.ARTISTIC, LocationType.NATURE }),
    METROPOLIS(new LocationType[] {LocationType.LANDMARK, LocationType.SCIENTIFIC,
        LocationType.INDUSTRIAL, LocationType.ARTISTIC, LocationType.ENTERTAINMENT }),
    EDUCATION(new LocationType[] {LocationType.HISTORICAL, LocationType.SCIENTIFIC,
        LocationType.ARTISTIC, LocationType.CULTURAL });
    
    LocationType[] listLocations;
    
    JourneyType(LocationType[] list)
    {
        listLocations = list;
    }
    
    public String getListLocationType()
    {
        String result = "(";
        for (int i = 0; i < listLocations.length; ++i)
        {
            if (i != 0)
            {
                result += ", ";
            }
            result += "'" + listLocations[i].name() + "'";
        }
        result += ")";
        
        return result;
    }
}
