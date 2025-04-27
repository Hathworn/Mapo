#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_rand(hiprandState *states, float* randArr) {
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;

    // Initialize CURAND state
    hiprandState localState;
    hiprand_init(1234, tid, 0, &localState);

    // Generate random number and store in array
    randArr[tid] = 2.f * M_PI * hiprand_uniform(&localState);
}