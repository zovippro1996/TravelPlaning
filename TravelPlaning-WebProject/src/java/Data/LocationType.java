/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

/**
 *
 * @author krankai
 */
public enum LocationType
{
    HISTORICAL, CULTURAL, ARTISTIC, SCIENTIFIC, INDUSTRIAL, LANDMARK,
    HOTEL, RESTAURANT, THEMEPARK, BEACH
    
    /**
     * 
     *  Get String representation of Enum --> Use enumVar.name();
     *      Ex:     LocationType type = LocationType.HISTORICAL;
     *              String locType = type.name();
     * 
     *  Get back the Enum of the specified String --> User Enum.valueOf(string)
     *      Ex:     String locType = "HISTORICAL";
     *              LocationType enum = LocationType.valueOf(locType);
     * 
     */
}
