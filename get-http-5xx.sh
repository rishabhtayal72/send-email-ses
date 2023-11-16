#!/bin/bash
curl -s http://del-platform-monitoring-prometheus.monitoring:9090/api/v1/query -d 'query=sum(increase(orchestrator_http_requests_total{status=~"5.."}[7d])) by (path)'  | jq -r '.data.result[] | [.metric.path,(.value[-1] | tonumber | floor)] | @csv' > http-5xx.csv
sed -i -e '1i"Path","Count"' http-5xx.csv
python3 ses.py