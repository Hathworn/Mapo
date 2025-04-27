#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_randoms(unsigned int seed, hiprandState_t* states) {
    // Calculate unique thread index using direct calculation
    int index = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;

    // Initialize random state for each thread
    hiprand_init(seed, index, 0, &states[index]);
}