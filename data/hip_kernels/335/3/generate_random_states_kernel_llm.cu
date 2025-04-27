#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_random_states_kernel(unsigned int seed, hiprandState_t* d_states, size_t total_number) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Check if within bounds and initialize state if true
    if (idx < total_number) {
        hiprand_init(seed, idx, 0, &d_states[idx]);
    }
    // No need for __syncthreads() as it is not required for independent states
}