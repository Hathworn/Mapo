#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_coords_3D(float* coords, size_t z, size_t y, size_t x) {
    // Calculate global thread index
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the index is within bounds
    if (index < x * y * z) {
        size_t id_x = index % x;
        size_t id_y = (index / x) % y;
        size_t id_z = index / (x * y);

        // Compute and assign the coordinates
        float zOffset = (float)z / 2.0;
        float yOffset = (float)y / 2.0;
        float xOffset = (float)x / 2.0;
        
        coords[index] = id_z - zOffset;
        coords[index + x * y * z] = id_y - yOffset;
        coords[index + 2 * x * y * z] = id_x - xOffset;
    }
    // Removing unnecessary __syncthreads()
}