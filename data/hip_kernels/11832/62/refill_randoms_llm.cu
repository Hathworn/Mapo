```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refill_randoms(float *dRand, int N, hiprandState *states)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Simplified total threads calculation
    hiprandState localState = states[tid]; // Load the state into a local variable

    for (int i = tid; i < N; i += stride)
    {
        dRand[i] = hiprand_uniform(&localState); // Use the local state variable
    }

    states[tid] = localState; // Store the updated state back to global memory
}