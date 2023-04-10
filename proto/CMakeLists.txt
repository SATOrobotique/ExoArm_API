cmake_minimum_required(VERSION 3.0.2)
project(exoarm_dev)

set(Protobuf_LIBRARY "/usr/local/lib/libprotobuf.so")
set(Protobuf_INCLUDE_DIR "/usr/local/include")

include(FindProtobuf)
find_package(Protobuf 3.21.12 REQUIRED)
include_directories(${Protobuf_INCLUDE_DIR})
protobuf_generate_cpp(Proto_SRC Proto_HEADER robot_comm.proto)
add_library(proto ${Proto_SRC} ${Proto_HEADER})
target_include_directories(proto INTERFACE ${CMAKE_CURRENT_BINARY_DIR})
message(${Protobuf_LIBRARIES})

target_link_libraries(proto INTERFACE ${Protobuf_LIBRARIES})