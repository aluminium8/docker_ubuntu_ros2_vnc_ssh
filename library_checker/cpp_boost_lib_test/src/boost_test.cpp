#include <iostream>
#include <boost/version.hpp>

int main() {
  //バージョンの出力
  std::cout << "boost version:" << BOOST_VERSION << std::endl;
  std::cout << "boost lib version:" << BOOST_LIB_VERSION << std::endl;
  return 0;
}