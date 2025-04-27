#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReturnFloat(float *sum, float *out, const float *pIn) {
    extern __shared__ float s[];
    int tid = threadIdx.x;
    s[tid] = pIn[tid];
    __syncthreads();

    // Use atomic operations directly on output to avoid shared memory contention
    atomicAdd(&sum[tid], pIn[tid]);
    __syncthreads();

    // Write result directly to output
    out[tid] = sum[tid];
}