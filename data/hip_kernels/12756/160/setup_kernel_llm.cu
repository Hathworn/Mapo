#include "hip/hip_runtime.h"
#include "includes.h"

// Using the hipLaunchBounds macro to optimize occupancy
__global__ void __launch_bounds__(256, 4) setup_kernel(hiprandState *state, unsigned long seed) {

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimized to use fewer registers and increase efficiency
    if (i < gridDim.x * blockDim.x) {
        hiprand_init(seed, i, 0, &state[i]);
    }
}