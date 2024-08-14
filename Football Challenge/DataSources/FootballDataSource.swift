//
//  DataSource.swift
//  Football Challenge
//
//  Created by Adrian Richard Talbot on 12/08/2024.
//

import Foundation

struct FootballDataSource {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getTeamsList(_ numTeams: Int = 25) async -> [Team] {
        // Check we have an api key
        guard apiKey != nil else {
            print("No api key")
            return [Team]()
        }
        
        // Form URL
        if let url = URL(string: "https://api.football-data.org/v4/teams?limit=\(numTeams)") {
            
            // Create the request
            var request = URLRequest(url: url)
            
            // Add the authorization header
            request.addValue(apiKey!, forHTTPHeaderField: "X-Auth-Token")
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("Response code: \(httpResponse.statusCode)")
                    
                    if (httpResponse.statusCode == 200) {
                        let decoder = JSONDecoder()
                        
                        do {
                            let teamsList = try decoder.decode(TeamList.self, from: data)
                            
                            return teamsList.teams
                        } catch {
                            print("An error occurred decoding the teamsList: \(error)")
                        }
                    } else {
                        return [Team]()
                    }
                }
            } catch {
                print("An error occurred \(error)")
                return [Team]()
            }
        }
        
        return [Team]()
    }
}
