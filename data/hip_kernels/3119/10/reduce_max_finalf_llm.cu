#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256
#define MIN_DISTANCE 1.0

// ================================================================
__global__ void reduce_max_finalf(float *g_idata, float *g_odata, int * max_idx, unsigned int n, int blockSize)
{
    __shared__ float sdata[THREADS_PER_BLOCK];
    __shared__ int idxData[THREADS_PER_BLOCK];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockSize * 2) + tid;
    unsigned int gridSize = blockSize * 2 * gridDim.x;

    float myMax = 0.0;
    int myMaxIndex = -1;  // Initializing index for safety

    // Loop over elements in strides
    while (i < n)
    {
        if (myMax < g_idata[i])
        {
            myMax = g_idata[i];
            myMaxIndex = max_idx[i];
        }
        if (i + blockSize < n)
        {
            if (myMax < g_idata[i + blockSize])
            {
                myMax = g_idata[i + blockSize];
                myMaxIndex = max_idx[i + blockSize];
            }
        }
        i += gridSize;
    }

    sdata[tid] = myMax;
    idxData[tid] = myMaxIndex;

    __syncthreads();

    // Use a loop for reductions instead of unrolling
    for (unsigned int stride = blockSize / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            if (sdata[tid] < sdata[tid + stride])
            {
                sdata[tid] = sdata[tid + stride];
                idxData[tid] = idxData[tid + stride];
            }
        }
        __syncthreads();
    }

    if (tid == 0)
    {
        g_odata[blockIdx.x] = sdata[0];
        max_idx[blockIdx.x] = idxData[0];
    }
}