// The following includes are required if the following line is missing:
//
// ```cmake
// target_precompile_headers(${PROJECT_NAME} REUSE_FROM objects)
// ```
//
#include <string>
#include <cstdio>
#include <cstdlib>

#include <application/random.hpp>

int main() {
  try {
    std::puts(application::random().data());
  }
  catch (const std::exception& e) {
    std::fputs(e.what(), stderr);
    std::fputc('\n', stderr);
    std::fflush(stderr);
    return EXIT_FAILURE;
  }
  return EXIT_SUCCESS;
}
