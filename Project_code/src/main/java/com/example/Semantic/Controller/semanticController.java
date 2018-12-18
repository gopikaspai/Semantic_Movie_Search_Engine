package com.example.Semantic.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.io.ByteArrayOutputStream;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.query.ResultSetFormatter;



import com.hp.hpl.jena.query.QueryException;
@Controller
public class semanticController {
	static String defaultNameSpace = "http://org.semweb/assign4/people#";
	static String serviceEndPoint = "http://localhost:3030//MovieSearchEngine/query";
	static String strQuery1 = "prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> prefix owl: <http://www.w3.org/2002/07/owl#> prefix o1: <http://www.semanticweb.org/gopik/ontologies/2018/10/Merged#>prefix o2: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieActors#>SELECT ?Movie ?Actorname WHERE { ?Movie o2:hasActors ?Actorname }  LIMIT 11";
	static String strQuery2="prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>"
							+"prefix owl: <http://www.w3.org/2002/07/owl#>"
							+"prefix o1: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieYear#>"
							+"prefix o2: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieActors#>"
							+"SELECT ?Year (COUNT( ?movies ) AS ?TotalMoviesReleased) WHERE {?id o1:isOfYear ?Year. ?Year o1:hasAll ?movies.} GROUP BY ?Year";
//	static String strQuery3 = "prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>"
//			+"prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>"
//			+"prefix owl: <http://www.w3.org/2002/07/owl#>"
//			+"prefix xsd: <http://www.w3.org/2001/XMLSchema#>"
//			+"prefix o1: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieYear#> "
//			+"prefix o2: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieGenre#> "
//			+"prefix o3: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieDirectors#>"
//			+"prefix o4: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieRating#> "
//			+"prefix o5: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieGross#> "
//			+"prefix o6: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieDuration#>"
//			+"prefix o7: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieCountry#> "
//			+"prefix o8: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieBudget#> "
//			+"prefix o9: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieActors#> "
//			+"prefix linked: <http://www.semanticweb.org/gopik/ontologies/2018/10/Merged#> "
//			+"SELECT ?Year ?ActorName WHERE {?id o1:hasMovieTitle +"+title+"+. ?id o1:isOfYear ?Year. ?id2(owl:sameAs|^owl:sameAs)+ ?id. ?id2 o9:hasActors ?ActorName.}";


	
	JSONObject json3 = new JSONObject();
	@RequestMapping(method = RequestMethod.GET, value = "/getQuery1/{itemid}")
    public @ResponseBody Map<String, Object> getDistinctEvents(HttpServletRequest request, @PathVariable("itemid") String movName){
        
		System.out.println(movName);
		String query = buildString(movName);
		//System.out.println(loadHumanClasses(serviceEndPoint, strQuery1));
       // System.out.println(json3);
        return loadHumanClasses(serviceEndPoint, query).toMap();
    }

	private String buildString(String movName) {

		String strQuery3 = "prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>"
				+"prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>"
				+"prefix owl: <http://www.w3.org/2002/07/owl#>"
				+"prefix xsd: <http://www.w3.org/2001/XMLSchema#>"
				+"prefix o1: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieYear#> "
				+"prefix o2: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieGenre#> "
				+"prefix o3: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieDirectors#>"
				+"prefix o4: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieRating#> "
				+"prefix o5: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieGross#> "
				+"prefix o6: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieDuration#>"
				+"prefix o7: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieCountry#> "
				+"prefix o8: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieBudget#> "
				+"prefix o9: <http://www.semanticweb.org/chetanya/ontologies/2018/10/MovieActors#> "
				+"prefix linked: <http://www.semanticweb.org/gopik/ontologies/2018/10/Merged#> "
				+"SELECT ?Year ?ActorName WHERE {?id o1:hasMovieTitle " +movName+". ?id o1:isOfYear ?Year. ?id2(owl:sameAs|^owl:sameAs)+ ?id. ?id2 o9:hasActors ?ActorName.}";
		System.out.println(strQuery3);

		return strQuery3;
	}

	private JSONObject loadHumanClasses(String serviceURI, String query){
		String data = null;
		QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI, query);
		ResultSet results = q.execSelect();
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ResultSetFormatter.outputAsJSON(outputStream, results);
		JSONObject testV=new JSONObject(new String(outputStream.toByteArray()));
		System.out.println(testV);
		//return ResultSetFormatter.asXMLString(results);


		return testV;
		
	}
	

}
