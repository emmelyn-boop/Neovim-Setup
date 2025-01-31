
#include <cstdlib>
#include <iostream>
#include <string>

void getDistroInfo() {
  std::cout << "\033[1;32m[INFO] \033[0mDistro:\n";
  system("cat /etc/os-release");
}

void getUptimeInfo() {
  std::cout << "\033[1;32m[INFO] \033[0mUptime:\n";
  system("uptime -p");
}

int main() {
  std::cout << "\033[1;34m*** Sistem Informasi ***\033[0m\n";

  getDistroInfo();
  getUptimeInfo();

  return 0;
}
