#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void render_init(int max_x, int max_y, hiprandState *rand_state) {
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Return early for out-of-bound threads
    if (i >= max_x || j >= max_y) return;
    
    // Calculate the linear pixel index
    int pixel_index = j * max_x + i;
    
    // Initialize random state with unique seed for each pixel
    hiprand_init(1984, pixel_index, 0, &rand_state[pixel_index]);
}