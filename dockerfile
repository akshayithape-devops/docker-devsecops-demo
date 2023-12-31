# Build Stage
FROM golang:alpine3.17 as builder 
# Use the official Golang Alpine 3.17 image as the base image for the build stage.

WORKDIR /app
# Set the working directory for the build stage to /app.

COPY hello.go . 
# Copy the current directory (which contains the application code) to the build stage.

RUN go build hello.go
# Build the Go application, which produces an executable called "main".

# Deploy Stage
FROM alpine:3.18
# Use the latest Alpine image as the base image for the deploy stage.

WORKDIR /
# Set the working directory for the deploy stage to the root directory.

COPY --from=builder /app/hello /
# Copy the "main" executable from the build stage to the root directory of the deploy stage.

EXPOSE 8080
# Expose port 8080s for the application.

ENTRYPOINT [ "/hello" ]
# Set the command to run when the container starts to execute the "main" executable.
