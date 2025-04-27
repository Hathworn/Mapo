#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Optimize by setting unique sequence numbers for each thread
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    hiprand_init(seed, id, 0, &state[id]);
}