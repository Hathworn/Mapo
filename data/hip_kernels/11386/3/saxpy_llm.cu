#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy(int * a, int * b, int * c)
{
    // Fetch per-thread offset to process each element
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop to maximize utilization of warp
    #pragma unroll
    if (tid < N) {
        c[tid] = 2 * a[tid] + b[tid];
    }
}