#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_coords_2D(float* coords, size_t y, size_t x) {
    // Calculate global thread index
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only proceed for valid index
    if (index < x * y) {
        size_t id_x = index % x;
        size_t id_y = index / x;

        // Assign computed coordinates
        size_t base_index = id_x + id_y * x;
        coords[base_index] = id_y - (float)y / 2.0;
        coords[base_index + x * y] = id_x - (float)x / 2.0; 
    }
    // Remove unnecessary __syncthreads() since no shared memory is used
}