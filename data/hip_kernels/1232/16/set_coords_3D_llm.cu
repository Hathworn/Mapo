#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_coords_3D(float* coords, size_t z, size_t y, size_t x) {
    // Calculate global thread index
    size_t index = blockIdx.x * blockDim.x + threadIdx.x; 

    // Compute 3D coordinates only if index is within bounds
    if (index < x * y * z) {
        size_t xy = x * y; // Cache frequently used value
        size_t id_z = index / xy; 
        size_t id_y = (index % xy) / x; 
        size_t id_x = index % x; 

        // Compute and write coordinates to global memory
        coords[index] = id_z - (float)z / 2.0f;
        coords[index + xy] = id_y - (float)y / 2.0f;
        coords[index + 2 * xy] = id_x - (float)x / 2.0f;
    }
}