import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Date;

public class distro {

    public static void main(String[] args) {
        displaySystemInfo();
        displayProgrammingStatus();
    }

    public static void displaySystemInfo() {
        File osRelease = new File("/etc/os-release");
        File uptimeFile = new File("/proc/uptime");
        String time = new Date().toString();

        System.out.println("Distro Information:");
        System.out.println("Time: " + time);
        System.out.println("Hostname: " + System.getenv("HOSTNAME"));
        System.out.println("User: " + System.getProperty("user.name"));

        if (osRelease.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(osRelease))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    if (line.startsWith("NAME=") || line.startsWith("VERSION=")) {
                        System.out.println(line);
                    }
                }
            } catch (IOException e) {
                System.out.println("Error reading /etc/os-release file: " + e.getMessage());
            }
        } else {
            System.out.println("Unable to read /etc/os-release file.");
        }

        if (uptimeFile.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(uptimeFile))) {
                String[] uptimeData = reader.readLine().split(" ");
                double uptime = Double.parseDouble(uptimeData[0]);
                int hours = (int) (uptime / 3600);
                int minutes = (int) ((uptime % 3600) / 60);
                System.out.println("Uptime: " + hours + " hours, " + minutes + " minutes");
            } catch (IOException e) {
                System.out.println("Error reading uptime information: " + e.getMessage());
            }
        } else {
            System.out.println("Unable to read uptime information.");
        }
    }

    public static void displayProgrammingStatus() {
        System.out.println("\nProgramming Progress:");
        displayProgressBar("Java", 1);
        displayProgressBar("Python", 30);
        displayProgressBar("HTML", 10);
        displayProgressBar("CSS", 10);
        displayProgressBar("JavaScript", 5);
    }

    public static void displayProgressBar(String language, int percentage) {
        int barLength = 40;
        int filledLength = (int) (barLength * percentage / 100.0);
        StringBuilder bar = new StringBuilder();
        for (int i = 0; i < filledLength; i++) {
            bar.append("#");
        }
        for (int i = filledLength; i < barLength; i++) {
            bar.append("-");
        }
        System.out.println(language + ": " + percentage + "%");
        System.out.println("|" + bar + "| " + percentage + "%");
    }
}

