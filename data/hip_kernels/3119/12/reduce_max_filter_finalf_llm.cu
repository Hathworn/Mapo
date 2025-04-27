#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256
#define MIN_DISTANCE 1.0

__device__ bool checkDistancef(volatile int *maxesRow, volatile int *maxesCol, int nMax, int curIdx, int width)
{
    int row = curIdx / width;
    int col = curIdx % width;
    for (int j = 0; j < nMax; j++)
    {
        if (maxesRow[j] == row && maxesCol[j] == col)
            return false;
    }
    return true;
}

__global__ void reduce_max_filter_finalf(float *g_idata, float *g_odata, int *max_idx, unsigned int n, unsigned int width, int blockSize, int *maxes, int nMax)
{
    __shared__ int smaxesRow[10];
    __shared__ int smaxesCol[10];
    __shared__ int smaxesVal[10];
    __shared__ float sdata[THREADS_PER_BLOCK];
    __shared__ int idxData[THREADS_PER_BLOCK];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockSize * 2) + tid;
    unsigned int gridSize = blockSize * 2 * gridDim.x;

    if (tid < nMax)
    {
        smaxesVal[tid] = maxes[tid];
        smaxesRow[tid] = smaxesVal[tid] / width;
        smaxesCol[tid] = smaxesVal[tid] % width;
    }
    __syncthreads();

    float myMax = 0.0;
    int myMaxIndex;

    while (i < n)
    {
        if (myMax < g_idata[i] && checkDistancef(smaxesRow, smaxesCol, nMax, max_idx[i], width))
        {
            myMax = g_idata[i];
            myMaxIndex = max_idx[i];
        }

        if (i + blockSize < n && myMax < g_idata[i + blockSize] && checkDistancef(smaxesRow, smaxesCol, nMax, max_idx[i + blockSize], width))
        {
            myMax = g_idata[i + blockSize];
            myMaxIndex = max_idx[i + blockSize];
        }

        i += gridSize; 
    }

    sdata[tid] = myMax;
    idxData[tid] = myMaxIndex;

    __syncthreads();

    // Start reduction
    if (blockSize >= 512 && tid < 256)
    {
        if (sdata[tid] < sdata[tid + 256] && checkDistancef(smaxesRow, smaxesCol, nMax, idxData[tid + 256], width))
        {
            sdata[tid] = sdata[tid + 256];
            idxData[tid] = idxData[tid + 256];
        }
        __syncthreads();
    }

    if (blockSize >= 256 && tid < 128)
    {
        if (sdata[tid] < sdata[tid + 128] && checkDistancef(smaxesRow, smaxesCol, nMax, idxData[tid + 128], width))
        {
            sdata[tid] = sdata[tid + 128];
            idxData[tid] = idxData[tid + 128];
        }
        __syncthreads();
    }

    if (blockSize >= 128 && tid < 64)
    {
        if (sdata[tid] < sdata[tid + 64] && checkDistancef(smaxesRow, smaxesCol, nMax, idxData[tid + 64], width))
        {
            sdata[tid] = sdata[tid + 64];
            idxData[tid] = idxData[tid + 64];
        }
        __syncthreads();
    }

    volatile float *vdata = sdata;
    volatile int *vidxData = idxData;
    volatile int *vsmaxesRow = smaxesRow;
    volatile int *vsmaxesCol = smaxesCol;

    if (tid < 32)
    {
        // Unroll last warp using volatile memory
        if (blockSize >= 64)
        {
            if (vdata[tid] < vdata[tid + 32] && checkDistancef(vsmaxesRow, vsmaxesCol, nMax, vidxData[tid + 32], width))
            {
                vdata[tid] = vdata[tid + 32];
                vidxData[tid] = vidxData[tid + 32];
            }
        }
        if (blockSize >= 32)
        {
            if (vdata[tid] < vdata[tid + 16] && checkDistancef(vsmaxesRow, vsmaxesCol, nMax, vidxData[tid + 16], width))
            {
                vdata[tid] = vdata[tid + 16];
                vidxData[tid] = vidxData[tid + 16];
            }
        }
        if (blockSize >= 16)
        {
            if (vdata[tid] < vdata[tid + 8] && checkDistancef(vsmaxesRow, vsmaxesCol, nMax, vidxData[tid + 8], width))
            {
                vdata[tid] = vdata[tid + 8];
                vidxData[tid] = vidxData[tid + 8];
            }
        }
        if (blockSize >= 8)
        {
            if (vdata[tid] < vdata[tid + 4] && checkDistancef(vsmaxesRow, vsmaxesCol, nMax, vidxData[tid + 4], width))
            {
                vdata[tid] = vdata[tid + 4];
                vidxData[tid] = vidxData[tid + 4];
            }
        }
        if (blockSize >= 4)
        {
            if (vdata[tid] < vdata[tid + 2] && checkDistancef(vsmaxesRow, vsmaxesCol, nMax, vidxData[tid + 2], width))
            {
                vdata[tid] = vdata[tid + 2];
                vidxData[tid] = vidxData[tid + 2];
            }
        }
        if (blockSize >= 2)
        {
            if (vdata[tid] < vdata[tid + 1] && checkDistancef(vsmaxesRow, vsmaxesCol, nMax, vidxData[tid + 1], width))
            {
                vdata[tid] = vdata[tid + 1];
                vidxData[tid] = vidxData[tid + 1];
            }
        }
        __syncthreads();
    }

    if (tid == 0)
    {
        g_odata[blockIdx.x] = sdata[0];
        max_idx[blockIdx.x] = idxData[0];

        if (gridDim.x == 1)
            maxes[nMax] = idxData[0];
    }
}