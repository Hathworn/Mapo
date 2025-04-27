#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Optimize thread indexing: use blockIdx and threadIdx for scalability
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Optimize seed using thread index
    hiprand_init(seed, idx, 0, &state[idx]);
}