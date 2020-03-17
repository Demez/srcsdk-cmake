project(particles)

ucm_add_dirs("${SRC_DIR}/particles" TO PARTICLES_SOURCES NO_HEADERS RECURSIVE)

include("lib")
add_dependencies(particles tier1 dmxloader tier2 mathlib)
target_link_libraries(particles tier1 dmxloader tier2 mathlib)
