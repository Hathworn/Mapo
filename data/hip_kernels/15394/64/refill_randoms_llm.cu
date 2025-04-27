#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refill_randoms(float *dRand, int N, hiprandState *states)
{
    // Calculate unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int nthreads = gridDim.x * blockDim.x;
    
    // Use local state to optimize memory accesses
    hiprandState localState = states[tid];

    for (int i = tid; i < N; i += nthreads)
    {
        // Generate random number using local state
        dRand[i] = hiprand_uniform(&localState);
    }
    
    // Update global state with local state
    states[tid] = localState;
}