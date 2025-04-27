#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void refill_randoms(float *dRand, int N, hiprandState *states)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int nthreads = gridDim.x * blockDim.x;
    hiprandState localState = states[tid];  // Load state once

    // Unroll loop by processing multiple elements per thread
    for (int i = tid; i < N; i += nthreads * 2)
    {
        dRand[i] = hiprand_uniform(&localState);
        if (i + nthreads < N) {  // Avoid out-of-bounds for the second element
            dRand[i + nthreads] = hiprand_uniform(&localState);
        }
    }

    states[tid] = localState;  // Save updated state
}