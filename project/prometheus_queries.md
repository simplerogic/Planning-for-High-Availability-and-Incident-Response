## Availability SLI
### The percentage of successful requests over the last 1 day
sum (rate(apiserver_request_total{job="apiserver",code!~"5.."}[1d]))
/
sum (rate(apiserver_request_total{job="apiserver"}[1d]))

## Latency SLI
### 90% of requests finish in these times
histogram_quantile(0.90,
sum(rate(apiserver_request_duration_seconds_bucket{job="apiserver"}[5m])) by (le, verb))

## Throughput
# Looked for all the 2** codes over 5 minutes for the apiserver
sum(rate(apiserver_request_total{job="apiserver",code=~"2.."}[1m]))

## Error Budget - Remaining Error Budget
### The error budget is 15%. successes / total requests / .15      
1 - ((1 - (sum(increase(apiserver_request_total{job="apiserver", code=~"2.."}[7d])) by (verb)) / sum(increase(apiserver_request_total{job="apiserver"}[7d])) by (verb)) / (1 - .85))
