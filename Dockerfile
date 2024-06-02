# Dockerfile
FROM fischerscode/flutter

# Set working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Run flutter doctor to ensure Flutter is installed
RUN flutter doctor

# Fetch dependencies
RUN flutter pub get

# Expose the APK output directory
VOLUME ["/app/build/app/outputs/flutter-apk"]

# Define the command to run the build
CMD ["flutter", "build", "apk", "--release"]
