#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *g_data, float value)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory to reduce global memory accesses
    extern __shared__ float sdata[];
    sdata[threadIdx.x] = g_data[idx];

    __syncthreads(); // Synchronize threads within the block

    // Perform computation in shared memory
    sdata[threadIdx.x] += value;

    __syncthreads(); // Synchronize threads before writing back

    // Write back to global memory
    g_data[idx] = sdata[threadIdx.x];
}