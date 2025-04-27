#include "hip/hip_runtime.h"
#include "includes.h"
// libs

__global__ void render_init(int mx, int my, hiprandState *randState, int seed) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure all threads within the block initialize their state
    if (i < mx && j < my) {
        int pixel_index = j * mx + i;
        // Different seed for each thread using pixel_index
        hiprand_init(seed + pixel_index, pixel_index, 0, &randState[pixel_index]);
    }
}