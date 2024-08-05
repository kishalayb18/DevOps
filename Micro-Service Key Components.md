# Micro-Service Key Components

#### 1. Client
These are the end-users who interact with the application via different interfaces like web, mobile, or PC.

#### 2. CDN (Content Delivery Network)
CDNs deliver static content like images, stylesheets, and JavaScript files efficiently by caching them closer to the user's location, reducing load times.

#### 3. Load Balancer
It distributes incoming network traffic across multiple servers, ensuring no single server becomes a bottleneck and improving the application's availability and reliability.

#### 4. API Gateway
An API Gateway acts as an entry point for all clients, handling tasks like request routing, composition, and protocol translation, which helps manage multiple microservices behind the scenes.

#### 5. Microservice
Each microservice is a small, independent service that performs a specific business function. They communicate with each other via APIs. 

#### 6. Message Broker
A message broker facilitates communication between microservices by sending messages between them, ensuring they remain decoupled and can function independently.

#### 7. Databases
Each microservice typically has its own database to ensure loose coupling. This can involve different databases for different microservices

#### 8. Identity Provider
This component handles user authentication and authorization, ensuring secure access to services.

#### 9. Service Registry and Discovery
This system keeps track of all microservices and their instances, allowing services to find and communicate with each other dynamically.

#### 10. Service Co-ordination (e.g., Zookeeper)
Tools like Zookeeper help manage and coordinate distributed services, ensuring they work together smoothly.
