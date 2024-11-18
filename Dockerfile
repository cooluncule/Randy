FROM dorowu/ubuntu-desktop-lxde-vnc:focal

# Expose the NoVNC port
EXPOSE 80

# Set the screen resolution (this can be overridden by an environment variable)
ENV RESOLUTION=1600x761

# Start the VNC server with the desired resolution
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
