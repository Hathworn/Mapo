#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Use thread and block indices to initialize different states
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    hiprand_init(seed, index, 0, &state[index]);
}