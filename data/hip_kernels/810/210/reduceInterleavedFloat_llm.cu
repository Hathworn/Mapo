#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceInterleavedFloat(float *g_idata, float *g_odata, unsigned int n)
{
    // Set thread ID and calculate global index
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    float* idata = g_idata + blockIdx.x * blockDim.x;

    // Boundary check
    if (idx >= n) return;

    // In-place reduction using shared memory for optimization
    extern __shared__ float sdata[];
    sdata[tid] = idata[tid];
    __syncthreads();

    // Perform reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}