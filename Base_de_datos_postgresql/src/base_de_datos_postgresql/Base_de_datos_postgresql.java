/*
Universidad de la sierra sur Lic. Informática
Luis Fernando Santiago Martínez
 */
package base_de_datos_postgresql;

import Conexion.conexion_Bd;

/**
 * @author Fercho
 */
public class Base_de_datos_postgresql {

    public static void main(String[] args) {
        System.out.println("Iniciando programa");
        conexion_Bd con = new conexion_Bd("Cinema");
        con.consultar();
        con.cerrarConexion();
    }
    
}
