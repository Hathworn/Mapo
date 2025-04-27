#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initCURAND(unsigned int seed, hiprandState_t* d_states) {
    // Initialize state with unique sequence per block and thread
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    hiprand_init(seed, idx, 0, &d_states[idx]);
}