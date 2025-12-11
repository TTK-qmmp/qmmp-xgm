cmake_minimum_required(VERSION 3.0)

project(xgm)

if(MSVC)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /Ox /W3 /wd4996")
else()
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -Wall")
endif()


#if(NOT TARGET emu2149) 
#    add_subdirectory(modules/emu2149) 
#endif()

#if(NOT TARGET emu2212)
#    add_subdirectory(modules/emu2212)
#endif()

#if(NOT TARGET emu2413)
#    add_subdirectory(modules/emu2413)
#endif()

#if(NOT TARGET emu8950)
#    add_subdirectory(modules/emu8950)
#endif()

#if(NOT TARGET emu76489)
#    add_subdirectory(modules/emu76489)
#endif()

#if(NOT TARGET kmz80)
#    add_subdirectory(modules/kmz80)
#endif()

include_directories(kss/modules)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

#file(GLOB SOURCES src/*.c src/**/*.c)
file(GLOB_RECURSE SOURCES *.c)

add_library(${PROJECT_NAME} STATIC ${SOURCES})
target_link_libraries(${PROJECT_NAME} emu2149 emu2212 emu2413 emu8950 emu76489 kmz80)
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}${STATIC_LIB_SUFFIX})

install(TARGETS ${PROJECT_NAME}
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    COMPONENT library
)

install(FILES nezint.h normalize.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME})
install(FILES kss/src/kssplay.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss)
install(FILES kss/src/kss/kss.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/kss)
install(FILES kss/src/vm/vm.h kss/src/vm/mmap.h kss/src/vm/detect.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/vm)
install(FILES kss/src/rconv/psg_rconv.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/rconv)
install(FILES kss/src/filters/dc_filter.h kss/src/filters/filter.h kss/src/filters/rc_filter.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/filters)
install(FILES kss/modules/emu2149/emu2149.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/emu2149)
install(FILES kss/modules/emu2212/emu2212.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/emu2212)
install(FILES kss/modules/emu2413/emu2413.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/emu2413)
install(FILES kss/modules/emu8950/emu8950.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/emu8950)
install(FILES kss/modules/emu8950/emuadpcm.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/emu8950)
install(FILES kss/modules/emu76489/emu76489.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/emu76489)
install(FILES kss/modules/kmz80/kmz80.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/kmz80)
install(FILES kss/modules/kmz80/kmtypes.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/kmz80)
install(FILES kss/modules/kmz80/kmevent.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/kss/kmz80)
install(FILES nezplug/nezplug.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/nezplug)
install(FILES jaytrax/jxs.h jaytrax/jaytrax.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/jaytrax)
install(FILES pac/pac.h pac/pacP.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME}/pac)
