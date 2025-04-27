#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randoms(hiprandState_t* states, float* numbers, float lower, float higher) {
    int index = blockDim.x * blockIdx.x + threadIdx.x;

    // Cache frequently accessed data in local variables
    float range = higher - lower;
    hiprandState_t localState = states[index];
    
    numbers[index] = lower + range * hiprand_uniform(&localState);

    // Store back the state
    states[index] = localState;
}