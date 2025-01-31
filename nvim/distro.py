import os
import platform
import time

def display_system_info():
    uptime_file = "/proc/uptime"
    time_now = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())

    print("DiFo:")
    print(f"Time: {time_now}")
    print(f"Hostname: {platform.node()}")
    print(f"User: {os.getlogin()}")

    try:
        with open("/etc/os-release", "r") as file:
            for line in file:
                if line.startswith("NAME=") or line.startswith("VERSION="):
                    print(line.strip())
    except FileNotFoundError:
        print("Unable to read /etc/os-release file.")
    
    try:
        with open(uptime_file, "r") as file:
            uptime_data = file.read().split()
            uptime = float(uptime_data[0])
            hours = int(uptime // 3600)
            minutes = int((uptime % 3600) // 60)
            print(f"Uptime: {hours} hours, {minutes} minutes")
    except FileNotFoundError:
        print("Unable to read uptime information.")

def display_programming_status():
    print("\nProgramming Progress:")
    display_progress_bar("Java", 90)
    display_progress_bar("Python", 75)
    display_progress_bar("HTML", 80)
    display_progress_bar("CSS", 60)
    display_progress_bar("JavaScript", 50)

def display_progress_bar(language, percentage):
    bar_length = 40
    filled_length = int(bar_length * percentage / 100)
    bar = "#" * filled_length + "-" * (bar_length - filled_length)
    print(f"{language}: {percentage}%")
    print(f"|{bar}| {percentage}%")

display_system_info()
display_programming_status()

