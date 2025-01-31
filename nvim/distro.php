<?php
$osRelease = file_get_contents('/etc/os-release');
if ($osRelease !== false) {
    echo nl2br($osRelease); 
    if (strpos($osRelease, 'Arch Linux') !== false) {
        echo "You are using BlackArch Linux";
    }
} else {
    echo "Unable to read /etc/os-release";
}
?>

