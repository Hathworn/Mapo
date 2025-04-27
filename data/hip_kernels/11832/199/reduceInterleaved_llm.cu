#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceInterleaved (int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    if(idx >= n) return;

    // In-place reduction in shared memory for faster access
    __shared__ int shared_data[1024]; // Assuming blockDim.x <= 1024, adjust if necessary
    shared_data[tid] = (idx < n) ? idata[tid] : 0;
    __syncthreads();

    // Unroll the loop for better parallel reduction
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            shared_data[tid] += shared_data[tid + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = shared_data[0];
}