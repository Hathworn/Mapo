#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colorsKernel(float* colors, hiprandState* states) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Combine array index calculations to minimize repetitive computation
    int color_index = 3 * id;

    // Fetch random state once and reuse
    hiprandState localState = states[id];

    // Generate random colors using the pre-fetched state
    colors[color_index] = hiprand_uniform(&localState);
    colors[color_index + 1] = hiprand_uniform(&localState);
    colors[color_index + 2] = hiprand_uniform(&localState);
}