FROM alpine:latest

RUN echo "Hello from ECR via GitHub Actions!" > /hello.txt

WORKDIR /app

RUN echo '#!/bin/sh' > /app/hello.sh && \
    echo 'echo "🚀 Hello from ECR!"' >> /app/hello.sh && \
    echo 'echo "📅 Current time: $(date)"' >> /app/hello.sh && \
    echo 'echo "🏷️  Image built via GitHub Actions"' >> /app/hello.sh && \
    echo 'cat /hello.txt' >> /app/hello.sh && \
    chmod +x /app/hello.sh

CMD ["/app/hello.sh"]
