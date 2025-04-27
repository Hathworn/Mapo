#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refill_randoms(float *dRand, int N, hiprandState *states)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Compute the stride for the grid

    hiprandState localState = states[tid]; // Use local copy of the state

    for (int i = tid; i < N; i += stride) // Use stride instead of nthreads
    {
        dRand[i] = hiprand_uniform(&localState); // Use local state for random generation
    }
    
    states[tid] = localState; // Save the state back
}