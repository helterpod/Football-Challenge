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
    
    // Function to request the list of competitions from the endpoint
    func getCompetitionsList(_ areas: [Int] = [Int]()) async -> [Competition] {
        guard apiKey != nil else {
            print("No api key")
            return [Competition]()
        }

        // Form the url of the endpoint
        var endpoint = "https://api.football-data.org/v4/competitions"
        if (!areas.isEmpty) {
            endpoint += "?areas="
            
            for area in areas {
                endpoint += String(area) + ","
            }
            // We have a surplus ',' so remove it
            endpoint.removeLast()
        }
        
        // Try to get the data from the endpoint
        if let url = URL(string: endpoint) {

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
                            let competitionsList = try decoder.decode(CompetitionList.self, from: data)
                            
                            return competitionsList.competitions
                        } catch {
                            print("An error occurred decoding the competitionsList: \(error)")
                        }
                    } else {
                        return [Competition]()
                    }
                }

            } catch {
                print("An error occurred. \(error)")
                return [Competition]()
            }
        }
        
        return [Competition]()
    }
    
    
    func getAreas() async -> [Area] {
        
        // Check we can perform an authorised GET
        guard apiKey != nil else {
            return [Area]()
        }
        
        // Form the endpoint URL
        if let url = URL(string: "https://api.football-data.org/v4/areas") {
            
            var request = URLRequest(url: url)
            request.addValue(apiKey!, forHTTPHeaderField: "X-Auth-Token")
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                // What was the result
                if let httpResponse = response as? HTTPURLResponse {
                
                    if (httpResponse.statusCode == 200) {

                        let decoder = JSONDecoder()
                        
                        do {
                            let areasList = try decoder.decode(AreaList.self, from: data)
                            
                            return areasList.areas
                        } catch {
                            print("An error occurred decoding the JSON: \(error)")
                        }
                    } else {
                        print("Status code = \(httpResponse.statusCode)")
                    }
                }
                
            } catch {
                print("Error making request: \(error)")
            }
        }
        
        return [Area]()
    }
}
