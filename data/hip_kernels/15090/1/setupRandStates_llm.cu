#include "hip/hip_runtime.h"
#include "includes.h"

#define N 100

__global__ void setupRandStates(hiprandState_t* state, unsigned int seed) {
    // Calculate global thread ID using built-in variables
    int thread_id = blockIdx.x * blockDim.x + threadIdx.x;
    // Each thread gets unique seed offset by thread ID
    hiprand_init(seed, thread_id, 0, &state[thread_id]);
}