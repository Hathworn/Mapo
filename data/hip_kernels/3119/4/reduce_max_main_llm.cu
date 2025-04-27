#include "hip/hip_runtime.h"
#include "includes.h"

// ================================================================

// Author: Timothy Blattner
// Date:   Wed Nov 30 12:36:40 2011 EScufftDoubleComplex

// ================================================================

#define THREADS_PER_BLOCK 256
#define MIN_DISTANCE 1.0

// ================================================================
__global__ void reduce_max_main(double *g_idata, double *g_odata, int * max_idx, unsigned int n, int blockSize)
{
    __shared__ double sdata[THREADS_PER_BLOCK];
    __shared__ int idxData[THREADS_PER_BLOCK];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockSize + tid;
    unsigned int gridSize = blockSize * gridDim.x;

    double myMax = 0.0;
    int myMaxIndex = -1; // Initialize with invalid index
    double val;

    // Process all elements in the block
    while (i < n)
    {
        val = g_idata[i];
        if (myMax < val)
        {
            myMax = val;
            myMaxIndex = i;
        }
        i += gridSize;
    }

    // Store local max and index to shared memory
    sdata[tid] = myMax;
    idxData[tid] = myMaxIndex;

    __syncthreads();

    // Reduce using shared memory
    if (blockSize >= 512) {
        if (tid < 256) {
            if (sdata[tid] < sdata[tid + 256]) {
                sdata[tid] = sdata[tid + 256];
                idxData[tid] = idxData[tid + 256];
            }
        }
        __syncthreads();
    }

    if (blockSize >= 256) {
        if (tid < 128) {
            if (sdata[tid] < sdata[tid + 128]) {
                sdata[tid] = sdata[tid + 128];
                idxData[tid] = idxData[tid + 128];
            }
        }
        __syncthreads();
    }

    if (blockSize >= 128) {
        if (tid < 64) {
            if (sdata[tid] < sdata[tid + 64]) {
                sdata[tid] = sdata[tid + 64];
                idxData[tid] = idxData[tid + 64];
            }
        }
        __syncthreads();
    }

    // Unrolling last warp for better performance
    if (tid < 32) {
        volatile double *vdata = sdata;
        volatile int *vidxData = idxData;
        if (sdata[tid] < vdata[tid + 32]) {
            vdata[tid] = vdata[tid + 32];
            vidxData[tid] = vidxData[tid + 32];
        }
        if (sdata[tid] < vdata[tid + 16]) {
            vdata[tid] = vdata[tid + 16];
            vidxData[tid] = vidxData[tid + 16];
        }
        if (sdata[tid] < vdata[tid + 8]) {
            vdata[tid] = vdata[tid + 8];
            vidxData[tid] = vidxData[tid + 8];
        }
        if (sdata[tid] < vdata[tid + 4]) {
            vdata[tid] = vdata[tid + 4];
            vidxData[tid] = vidxData[tid + 4];
        }
        if (sdata[tid] < vdata[tid + 2]) {
            vdata[tid] = vdata[tid + 2];
            vidxData[tid] = vidxData[tid + 2];
        }
        if (sdata[tid] < vdata[tid + 1]) {
            vdata[tid] = vdata[tid + 1];
            vidxData[tid] = vidxData[tid + 1];
        }
    }

    // Writing result back to the global memory
    if (tid == 0) {
        g_odata[blockIdx.x] = sdata[0];
        max_idx[blockIdx.x] = idxData[0];
    }
}