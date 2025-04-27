#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_init(unsigned long long seed, hiprandState_t * states_d, size_t size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if(idx >= size) return; // Early exit if thread index is out of bounds
    hiprand_init(seed, idx, 0, &states_d[idx]);
}