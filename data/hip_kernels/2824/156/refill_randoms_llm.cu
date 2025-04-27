#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refill_randoms(float *dRand, int N, hiprandState *states)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int nthreads = gridDim.x * blockDim.x;

    if (tid < N)
    {
        hiprandState localState = states[tid]; // Use local copy of state
        for (int i = tid; i < N; i += nthreads)
        {
            dRand[i] = hiprand_uniform(&localState); // Generate random number
        }
        states[tid] = localState; // Save state back to global memory
    }
}