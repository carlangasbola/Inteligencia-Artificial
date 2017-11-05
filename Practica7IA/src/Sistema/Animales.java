
package Sistema;

import alice.tuprolog.InvalidTheoryException;
import alice.tuprolog.MalformedGoalException;
import alice.tuprolog.NoSolutionException;
import alice.tuprolog.Prolog;
import alice.tuprolog.SolveInfo;
import alice.tuprolog.Term;
import alice.tuprolog.Theory;
import alice.tuprolog.UnknownVarException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;


public class Animales {
    
    private Prolog engine;
    private Theory tu;
    private String consulta;
    private SolveInfo solution;
    private Term animal, imagen;
    private String imagennombre;
    public ArrayList lista;

    public String getImagennombre() {
        return imagennombre;
    }

    public void setImagennombre(String imagennombre) {
        this.imagennombre = imagennombre;
    }
    
    public String consulta(String consulta) {
     String result="";
        try{
            lista = new ArrayList();
            // Creamos una nueva maquina
            engine = new Prolog();
            // Creamos una nueva teoria
            tu = new Theory(new FileInputStream("animalia.pl"));
            engine.setTheory(tu);
            // Concatenamos la consulta para que prolog la procese
            this.consulta = "quien(["+consulta+"],A,V,I,L).";
            System.out.print(this.consulta);
            // Buscamos la solucion
            solution = engine.solve(this.consulta);
        
            // Si la solucion fue exitosa
            if(solution.isSuccess()){
                // Si hay mas de una solucion
                while(solution.hasOpenAlternatives()){
                    // Recuperamos el nombre del animal
                    animal = solution.getTerm("V");
                    // Varible que setea el nombre de la imagen
                    imagennombre = animal.toString();
                    // Recuperamos el nombre de la imagen
                    imagen = solution.getTerm("I");
                    // Concatenamos el resultado para mostrarlo en el text area del panel
                    result = animal.toString() + "," + result;
                    // Agregamos el animal a la lista
                    lista.add(imagennombre);
                    //Buscamos la siguiente solucion si es que existe
                    solution = engine.solveNext();
                    
                }
            
            }else{
                imagennombre = "nada";
            }
        
        return result;
    }catch (Exception ex) {ex.printStackTrace();	}
    
     return result;
}
}
