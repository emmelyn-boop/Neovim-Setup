def osRelease = new File("/etc/os-release")
def uptimeFile = new File("/proc/uptime")

def time = new Date().format("yyyy-MM-dd'T'HH:mm:ssZ")

def showProgressBar(percentage) {
    int barLength = 40 
    int filledLength = (int)(barLength * percentage / 100)
    String bar = "#" * filledLength + "-" * (barLength - filledLength)
    println "|$bar| $percentage%"
}

def displaySystemInfo() {
    println "Distro Information:"
    println "Time: $time"
    println "Hostname: ${System.getenv("HOSTNAME")}"
    println "User: ${System.getProperty("user.name")}"

    if (osRelease.exists()) {
        osRelease.eachLine { line ->
            if (line.startsWith("NAME=") || line.startsWith("VERSION=")) {
                println line
            }
        }
    } else {
        println "Unable to read /etc/os-release file."
    }

    if (uptimeFile.exists()) {
        def uptime = uptimeFile.text.split(" ")[0].toDouble() 
        def hours = (int)(uptime / 3600)
        def minutes = (int)((uptime % 3600) / 60)
        println "Uptime: $hours hours, $minutes minutes"
    } else {
        println "Unable to read uptime information."
    }
}
def displayProgrammingStatus() {
    println "\nProgramming Progress:"
    println "Java: 90%"  
    showProgressBar(90) 
    println "Python: 75%"  
    showProgressBar(75) 
    println "HTML: 80%" 
    showProgressBar(80)     
    println "CSS: 60%"  
    showProgressBar(60)  
    println "JavaScript: 50%" 
    showProgressBar(50) 
}

displaySystemInfo()
displayProgrammingStatus()

