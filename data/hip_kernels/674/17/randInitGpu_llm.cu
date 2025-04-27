#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randInitGpu(hiprandState_t *state, const uint seed, const uint rank, const uint size) {
    uint bIdx = blockIdx.x + gridDim.x * blockIdx.y;
    uint idx = threadIdx.x + blockDim.x * bIdx;

    // Use a single expression to calculate initialization parameter
    uint init_param = seed * gridDim.x * gridDim.y + rank * size * gridDim.x * gridDim.y + bIdx;
    
    // Initialize state using calculated parameter
    hiprand_init(init_param, idx, 0, &state[idx]);
}