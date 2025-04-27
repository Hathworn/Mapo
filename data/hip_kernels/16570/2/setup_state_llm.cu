#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Utilize blockIdx and threadIdx to separate states and increase concurrency
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    hiprand_init(seed, id, 0, &state[id]);
}