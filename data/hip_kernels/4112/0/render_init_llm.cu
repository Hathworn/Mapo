#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void render_init(int max_x, int max_y, hiprandState *rand_state) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure that threads are within the bounds
    if (i < max_x && j < max_y) {
        int pixel_index = j * max_x + i;
        
        // Initialize random state for each pixel
        hiprand_init(pixel_index, 0, 0, &rand_state[pixel_index]);
    }
}