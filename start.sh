#!/bin/bash

# Start a simple HTTP server to keep Render Web Service alive
python3 -m http.server 8080 &

# Start tmate in background
tmate -S /tmp/tmate.sock new-session -d

# Wait for tmate to be ready
tmate -S /tmp/tmate.sock wait tmate-ready

# Print SSH and Web links
echo "=============================="
echo "✅ SSH Access:"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
echo "🌐 Web Terminal:"
tmate -S /tmp/tmate.sock display -p '#{tmate_web}'
echo "=============================="

# Show the link on the web page too
while true; do
    echo "<html><body><pre>" > index.html
    echo "✅ SSH Access:" >> index.html
    tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}' >> index.html
    echo "" >> index.html
    echo "🌐 Web Terminal:" >> index.html
    tmate -S /tmp/tmate.sock display -p '#{tmate_web}' >> index.html
    echo "</pre></body></html>" >> index.html
    sleep 60
done
