#!/bin/bash


# container health check
echo
echo "Container Health Status"
echo "-----------------------"
for container in "service-1" "service-2" "nginx-reverse-proxy"; do
  status=$(docker inspect --format='{{.State.Health.Status}}' "$container" 2>/dev/null || echo "unknown")
  if [ "$status" = "healthy" ]; then
    echo "✅ $container - $status"
  else
    echo "❌ $container - $status"
  fi
done

# testing system through nginx
echo
echo "Testing Through Nginx Reverse Proxy"
echo "----------------------------------"
for service in "service1" "service2"; do
  for endpoint in "/ping" "/hello"; do
    status_code=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:8000/$service$endpoint")
    if [ "$status_code" -eq 200 ]; then
      echo "✅ http://localhost:8000/$service$endpoint - HTTP 200"
    else
      echo "❌ http://localhost:8000/$service$endpoint - HTTP $status_code"
    fi
  done
done

echo
echo "Tests completed!"
