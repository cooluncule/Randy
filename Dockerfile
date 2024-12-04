# Use a Windows base image
FROM mcr.microsoft.com/windows:10.0.19041.685

# Expose the desired port
EXPOSE 80

# Set an environment variable for screen resolution (you'll need an application to support VNC on Windows)
ENV RESOLUTION=1600x761

# Add VNC server setup (example with TightVNC as a placeholder; install any necessary components)
RUN powershell -Command \
    Invoke-WebRequest -Uri https://www.tightvnc.com/download/2.8.63/tightvnc-2.8.63-setup-64bit.msi -OutFile C:\tightvnc.msi; \
    Start-Process msiexec.exe -ArgumentList '/i', 'C:\tightvnc.msi', '/quiet', '/norestart' -NoNewWindow -Wait; \
    Remove-Item -Path C:\tightvnc.msi

# Set the command to start the VNC server (example command; adjust based on your setup)
CMD ["C:\\Program Files\\TightVNC\\tvnserver.exe", "-run"]
