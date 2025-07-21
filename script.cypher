// This script loads characters and creates relationships between them.

// IMPORTANT: Replace the URL below with the "Raw" URL of your own characters.csv file.
// To get the URL: Go to your characters.csv file in GitHub and click the "Raw" button.
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Chandranshu0602/neo4j-certification-project/main/characters.csv' AS row
CREATE (p:Person {id: toInteger(row.id), name: row.name, location: row.location});

// Create relationships
MATCH (elara:Person {name: 'Elara'}), (kael:Person {name: 'Kael'})
CREATE (elara)-[:KNOWS]->(kael);

MATCH (elara:Person {name: 'Elara'}), (lyra:Person {name: 'Lyra'})
CREATE (elara)-[:FRIENDS_WITH]->(lyra);

// Query 1: Find all people from Rivertown
MATCH (p:Person {location: 'Rivertown'})
RETURN p.name;

// Query 2: Who does Elara know?
MATCH (elara:Person {name: 'Elara'})-[:KNOWS]->(other)
RETURN other.name;
