#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refill_randoms(float *dRand, int N, hiprandState *states)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Precompute stride

    hiprandState localState = states[tid]; // Load state into local variable

    for (int i = tid; i < N; i += stride)
    {
        dRand[i] = hiprand_uniform(&localState); // Use local copy of state
    }

    states[tid] = localState; // Save modified state back
}