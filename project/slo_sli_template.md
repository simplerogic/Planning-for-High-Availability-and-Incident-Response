# API Service

| Category     | SLI | SLO                                                                                                         |
|--------------|-----|-------------------------------------------------------------------------------------------------------------|
| Availability | 200 status codes or !5** status codes    | 99%                                                                                                         |
| Latency      | round trip web request ms    | 90% of requests below 100ms                                                                                 |
| Error Budget | failed requests / total requests    | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   | total number of HTTP requests over   | 5 RPS indicates the application is functioning                                                              |