#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UniformRandom(double *x, hiprandState *global_state) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (tid < gridDim.x * blockDim.x) { // Check boundary to ensure valid access
        hiprandState local_state = global_state[tid]; // Directly access global_state
        x[tid] = (double)hiprand_uniform(&local_state);
        global_state[tid] = local_state; // Store updated state back
    }
}