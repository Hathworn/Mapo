#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniDist(float* d_a, hiprandState_t* states, unsigned int size) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds; use local state copy for improved speed
    if (i < size) {
        hiprandState_t state = states[i];
        d_a[i] = hiprand_uniform(&state);
        states[i] = state; // Save state back to global memory
    }
}