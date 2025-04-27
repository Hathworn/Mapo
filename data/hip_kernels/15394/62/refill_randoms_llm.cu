#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refill_randoms(float *dRand, int N, hiprandState *states)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int nthreads = gridDim.x * blockDim.x;
    hiprandState state = states[tid]; // Load state for tid

    // Unroll loop for better performance
    for (int i = tid; i < N; i += nthreads * 4)
    {
        if (i < N) dRand[i] = hiprand_uniform(&state);
        if (i + nthreads < N) dRand[i + nthreads] = hiprand_uniform(&state);
        if (i + 2 * nthreads < N) dRand[i + 2 * nthreads] = hiprand_uniform(&state);
        if (i + 3 * nthreads < N) dRand[i + 3 * nthreads] = hiprand_uniform(&state);
    }

    states[tid] = state; // Save the updated state back
}