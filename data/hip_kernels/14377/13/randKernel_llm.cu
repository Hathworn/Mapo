#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randKernel(float* __restrict__ out, hiprandState* __restrict__ states, float min, float scale) {
    int id  = blockIdx.x * blockDim.x + threadIdx.x;
    // Prefetch state for potential better memory access
    hiprandState localState = states[id];
    // Use local state to generate random number
    float randomValue = hiprand_uniform(&localState) * scale + min;
    // Store result
    out[id] = randomValue;
    // Store the state back, if states can change per call
    states[id] = localState;
}