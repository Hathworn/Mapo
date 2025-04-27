```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void testKernel(float *g_idata, float *g_odata)
{
    // Shared memory
    extern __shared__ float sdata[];

    // Access thread id and total number of threads
    const unsigned int tid = threadIdx.x;
    const unsigned int block_size = blockDim.x;
    const unsigned int gid = blockIdx.x * block_size + tid; // Calculate global index

    // Optimized to use global index
    sdata[tid] = g_idata[gid];
    __syncthreads();

    // Perform computations
    sdata[tid] *= block_size;
    __syncthreads();

    // Write data to global memory
    g_odata[gid] = sdata[tid];
}