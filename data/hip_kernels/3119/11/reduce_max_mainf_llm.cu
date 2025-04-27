#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256
#define MIN_DISTANCE 1.0

__global__ void reduce_max_mainf(float *g_idata, float *g_odata, int *max_idx, unsigned int n, int blockSize)
{
    __shared__ float sdata[THREADS_PER_BLOCK];
    __shared__ int idxData[THREADS_PER_BLOCK];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockSize + tid;
    unsigned int gridSize = blockSize * gridDim.x;

    float myMax = -FLT_MAX; // Initialize to a very small number
    int myMaxIndex = -1;

    // Unrolling the loop and handling boundaries
    while (i < n) {
        float val = g_idata[i];
        if (myMax < val) {
            myMax = val;
            myMaxIndex = i;
        }
        i += gridSize;
    }

    sdata[tid] = myMax;
    idxData[tid] = myMaxIndex;
    __syncthreads();

    // Reduce using a single loop
    for (unsigned int s = blockSize / 2; s > 32; s >>= 1) {
        if (tid < s) {
            if (sdata[tid] < sdata[tid + s]) {
                sdata[tid] = sdata[tid + s];
                idxData[tid] = idxData[tid + s];
            }
        }
        __syncthreads();
    }

    // Warp reduction without __syncthreads
    if (tid < 32) {
        volatile float *vdata = sdata;
        volatile int *vidxData = idxData;
        if (vdata[tid] < vdata[tid + 32]) {
            vdata[tid] = vdata[tid + 32];
            vidxData[tid] = vidxData[tid + 32];
        }
        if (vdata[tid] < vdata[tid + 16]) {
            vdata[tid] = vdata[tid + 16];
            vidxData[tid] = vidxData[tid + 16];
        }
        if (vdata[tid] < vdata[tid + 8]) {
            vdata[tid] = vdata[tid + 8];
            vidxData[tid] = vidxData[tid + 8];
        }
        if (vdata[tid] < vdata[tid + 4]) {
            vdata[tid] = vdata[tid + 4];
            vidxData[tid] = vidxData[tid + 4];
        }
        if (vdata[tid] < vdata[tid + 2]) {
            vdata[tid] = vdata[tid + 2];
            vidxData[tid] = vidxData[tid + 2];
        }
        if (vdata[tid] < vdata[tid + 1]) {
            vdata[tid] = vdata[tid + 1];
            vidxData[tid] = vidxData[tid + 1];
        }
    }

    if (tid == 0) {
        g_odata[blockIdx.x] = sdata[0];
        max_idx[blockIdx.x] = idxData[0];
    }
}