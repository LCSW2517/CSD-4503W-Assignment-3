# Use lightweight nginx image

FROM nginx:alpine

# Copy HTML to nginx web directory

COPY index.html /usr/share/nginx/html/index.html

COPY style.css /usr/share/nginx/html/style.css

COPY image.jpg /usr/share/nginx/html/image.jpg

# Expose port 8085
EXPOSE 8085

# Change Nginx to listen on 8085
RUN sed -i 's/listen       80;/listen       8085;/' /etc/nginx/conf.d/default.conf

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]