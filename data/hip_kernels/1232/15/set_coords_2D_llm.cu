#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_coords_2D(float* coords, size_t y, size_t x) {
    // Calculate global index in flattened grid
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (index < x * y) {
        // Calculate 2D indices from flattened index
        size_t id_x = index % x;
        size_t id_y = index / x;
        
        // Calculate and set coordinates
        coords[index] = id_y - (float)y / 2.0;
        coords[index + x * y] = id_x - (float)x / 2.0;
    }
    // No need for __syncthreads() as there are no shared resources.
}