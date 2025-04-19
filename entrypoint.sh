#!/bin/bash
echo "Starting Spring Boot app..."
# Keep the shell alive
#exec /bin/bash -c tail -f /dev/null
exec gradle bootRun --args='--spring.profiles.active=dev'