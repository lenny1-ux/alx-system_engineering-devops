Postmortem: Web Application Outage on May 14, 2024
Even the best systems have their cat-astrophic moments!
Issue Summary
Duration: May 14, 2024, 09:00 AM - 12:30 PM UTC + 3
Impact: The primary web application experienced significant slowdowns and intermittent outages. Approximately 70% of users were affected, encountering long load times and timeouts.
Root Cause: A load balancer misconfiguration caused uneven distribution of traffic, overwhelming some servers while others enjoyed a nice coffee break.
Timeline
09:05 AM: Issue detected via monitoring alert indicating high latency and increased error rates.
09:10 AM: Engineering team began investigating the application servers for potential issues.
09:25 AM: Initial assumption was a database bottleneck; database performance metrics were reviewed.
09:45 AM: Misleading investigation into database revealed normal operation, shifting focus to the network infrastructure.
10:00 AM: Traffic analysis suggested an uneven distribution of requests among servers.
10:15 AM: Network team escalated the issue to the DevOps team.
10:30 AM: DevOps team identified a recent change in the load balancer configuration as the potential cause.
10:45 AM: Rollback of the load balancer configuration change initiated.
11:15 AM: Rollback completed; monitoring showed gradual improvement in performance.
12:30 PM: Full service restoration confirmed with all systems operating normally.
Root Cause and Resolution
Root Cause:
The root cause was traced to a load balancer configuration change made during routine maintenance. The configuration inadvertently disabled the round-robin traffic distribution algorithm, causing certain servers to become overwhelmed with traffic while others remained idle.
Resolution:
The issue was resolved by rolling back the load balancer configuration to the previous stable state. Post-rollback, the system was closely monitored to ensure even traffic distribution across all servers. Additional load tests were conducted to confirm the stability and performance of the application.
Corrective and Preventative Measures
Improvements:
Load Balancer Configuration Review: Implement a thorough review process for changes to load balancer configurations.
Enhanced Monitoring: Develop and deploy enhanced monitoring for traffic distribution across servers to detect and alert on uneven traffic patterns.
Documentation and Training: Update the documentation on load balancer configurations and provide additional training for the DevOps team.
Tasks:
Patch Load Balancer: Apply the latest patches and updates to the load balancer software to prevent similar issues.
Add Monitoring Alerts: Create and configure monitoring alerts specifically for load balancer traffic distribution metrics.
Conduct Load Testing: Schedule regular load testing to ensure the system can handle traffic spikes and to validate configuration changes.
Update Change Management Procedures: Enhance the change management procedures to include a mandatory peer review and testing phase for load balancer configuration changes.
Implement Automated Rollback: Develop scripts for automated rollback of load balancer configurations to reduce downtime in case of future misconfigurations.




#Author
Leonard Sammy



And remember, always keep calm and carry on debugging! 🐱‍💻

