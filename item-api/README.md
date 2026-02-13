# Item API - Spring Boot Project

Simple REST API to manage items (add & fetch items).

## Tech Stack
- Java 17
- Spring Boot
- Maven

## How to Run
1. Open project in IntelliJ
2. Run `ItemApiApplication.java`
3. App runs on: `http://localhost:8080`

## API Endpoints

### Add Item
POST `/items`

```json
{
  "id": 1,
  "name": "Laptop",
  "description": "Gaming laptop"
}
