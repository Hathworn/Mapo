#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void refill_randoms(float *dRand, int N, hiprandState *states)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int nthreads = gridDim.x * blockDim.x;
    hiprandState localState = states[tid];  // Use a local copy of the state

    for (int i = tid; i < N; i += nthreads)
    {
        dRand[i] = hiprand_uniform(&localState);  // Use local state
    }

    states[tid] = localState;  // Save the updated state back
}