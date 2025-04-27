#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(unsigned int seed, hiprandState_t* states) {
    // improved indexing for better performance
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // initialize the state using improved index to leverage more threads
    hiprand_init(seed, idx, 0, &states[idx]);
}