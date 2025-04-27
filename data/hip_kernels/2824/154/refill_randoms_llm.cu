#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refill_randoms(float *dRand, int N, hiprandState *states)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    hiprandState localState = states[tid]; // Load state into a local variable

    for (int i = tid; i < N; i += stride)
    {
        dRand[i] = hiprand_uniform(&localState); // Use local state for uniform distribution
    }
    
    states[tid] = localState; // Save the state back to global memory
}