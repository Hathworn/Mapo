#include "hip/hip_runtime.h"
#include "includes.h"

// ================================================================
#define THREADS_PER_BLOCK 256
#define MIN_DISTANCE 1.0

__global__ void reduce_max_final(double *g_idata, double *g_odata, int *max_idx, unsigned int n, int blockSize)
{
    __shared__ double sdata[THREADS_PER_BLOCK];
    __shared__ int idxData[THREADS_PER_BLOCK];

    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockSize * 2) + tid;
    unsigned int gridSize = blockSize * 2 * gridDim.x;

    double myMax = -1.0;
    int myMaxIndex = -1;

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

    // Utilize loop to reduce code repetition in warp reduction
    for (unsigned int s = blockSize / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            if (sdata[tid] < sdata[tid + s])
            {
                sdata[tid] = sdata[tid + s];
                idxData[tid] = idxData[tid + s];
            }
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0)
    {
        g_odata[blockIdx.x] = sdata[0];
        max_idx[blockIdx.x] = idxData[0];
    }
}