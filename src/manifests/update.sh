#!/bin/bash

start=$(date +%s)
kubectl -n do10-part2 set image deployment/do10-part2-report-service-app do10-part2-report-service=docker.mcshine.ru/library/do10-report:0.2
kubectl -n do10-part2 rollout status deployment/do10-part2-report-service-app
end=$(date +%s)
echo "Recreate - $((end - start)) seconds"

start=$(date +%s)
kubectl -n do10-part2 set image deployment/do10-part2-booking-service-app do10-part2-booking-service=docker.mcshine.ru/library/do10-booking:0.2
kubectl -n do10-part2 rollout status deployment/do10-part2-booking-service-app
end=$(date +%s)
echo "Rollout - $((end - start)) seconds"