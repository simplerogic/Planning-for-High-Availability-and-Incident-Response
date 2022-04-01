# API Service

| Category     | SLI                                    | SLO                                                                      |
|--------------|----------------------------------------|--------------------------------------------------------------------------|
| Availability | 200 status codes or !5** status codes  | 99% successful status codes over an hour                                 |
| Error Budget | failed requests / total requests       | 15% of the requests can fail                                             |
| Latency      | round trip web request ms              | 90% of requests below 100ms                                              |  
| Throughput   | total number of HTTP requests          | 300 Requests per minute                                                  |