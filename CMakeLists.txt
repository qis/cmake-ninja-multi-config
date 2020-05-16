cmake_minimum_required(VERSION 3.17 FATAL_ERROR)
project(application LANGUAGES CXX)

# Sources
file(GLOB_RECURSE sources src/${PROJECT_NAME}/*.[hc]pp)

# Objects
add_library(objects OBJECT ${sources})
target_precompile_headers(objects PRIVATE <${PROJECT_NAME}/common.hpp>)
target_include_directories(objects PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)
target_compile_definitions(objects PUBLIC NOMINMAX WIN32_LEAN_AND_MEAN)
target_compile_features(objects PUBLIC cxx_std_20)

# Executable
add_executable(${PROJECT_NAME} src/main.cpp)

# Comment out the following line to fix Ninja.
target_precompile_headers(${PROJECT_NAME} REUSE_FROM objects)

target_link_libraries(${PROJECT_NAME} PRIVATE objects)
