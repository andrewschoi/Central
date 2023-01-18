# Central
An activity-management tool that allows college students discover nearby events.

Abides with MVVM architecture, uses native Swift networking libraries (URLSession, URLRequests) to communicate with its backend. Our backend consists of Lambda functions (that interact with S3 and DynamoDB), connected to API Gateway triggers; handles image uploads with base64 encodings/decodings. Additionally, uses cloudwatch events to routinely clean up events that have already occurred.
