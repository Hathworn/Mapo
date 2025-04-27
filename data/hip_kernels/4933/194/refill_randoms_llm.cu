#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refill_randoms(float *dRand, int N, hiprandState *states)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int nthreads = gridDim.x * blockDim.x;
    hiprandState localState = states[tid];  // Load state to a local variable for efficiency

    for (int i = tid; i < N; i += nthreads)
    {
        dRand[i] = hiprand_uniform(&localState);
    }

    states[tid] = localState;  // Store state back to global memory
}