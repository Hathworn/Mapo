```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setupRandomKernel(hiprandState* states, unsigned long long seed) {
    // Calculate the global thread ID only once
    unsigned tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use initiate function to set up random state
    hiprand_init(seed, tid, 0, &states[tid]);
}