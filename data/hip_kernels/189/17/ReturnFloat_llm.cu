#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReturnFloat( float *sum, float *out, const float *pIn )
{
    extern __shared__ float s[];

    // Load input data into shared memory
    unsigned int tid = threadIdx.x;
    s[tid] = pIn[tid];
    __syncthreads();

    // Perform atomic addition
    atomicAdd(sum, s[tid]);

    // Write the result to the output
    out[tid] = s[tid];
}