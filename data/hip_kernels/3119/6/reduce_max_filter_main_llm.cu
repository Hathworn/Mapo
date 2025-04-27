#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256
#define MIN_DISTANCE 1.0

__device__ bool checkDistance(int *maxesRow, int *maxesCol, int nMax, int curIdx, int width)
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

__device__ double distance(int x1, int x2, int y1, int y2) 
{
    return ((double(x1-x2))*(double(x1-x2))) + 
           ((double(y1-y2))*(double(y1-y2)));
}

__global__ void reduce_max_filter_main(double *g_idata, double *g_odata, int *max_idx, unsigned int width, unsigned int height, int blockSize, int *maxes, int nMax)
{
    __shared__ int smaxesRow[10];
    __shared__ int smaxesCol[10];
    __shared__ int smaxesVal[10];
    __shared__ double sdata[THREADS_PER_BLOCK];
    __shared__ int idxData[THREADS_PER_BLOCK];
    
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockSize) + tid;
    unsigned int gridSize = blockSize * gridDim.x;

    // Initialize shared memory
    if (tid < nMax)
    {
        smaxesVal[tid] = maxes[tid];
        smaxesRow[tid] = smaxesVal[tid] / width;
        smaxesCol[tid] = smaxesVal[tid] % width;
    }
    __syncthreads(); // Ensure all threads initialize shared memory

    double myMax = -INFINITY;
    int myMaxIndex;
    double val;

    // Unrolled loop for better performance
    while (i < width * height)
    {
        val = g_idata[i];
        if (myMax < val)
        {
            if (checkDistance(smaxesRow, smaxesCol, nMax, i, width))
            {
                myMax = val;
                myMaxIndex = i;
            }
        }
        
        int nextIdx = i + blockSize;
        if (nextIdx < width * height)
        {
            val = g_idata[nextIdx];
            if (myMax < val)
            {
                if (checkDistance(smaxesRow, smaxesCol, nMax, nextIdx, width))
                {
                    myMax = val;
                    myMaxIndex = nextIdx;
                }
            }
        }
        
        i += gridSize;
    }

    sdata[tid] = myMax;
    idxData[tid] = myMaxIndex;

    __syncthreads(); // Synchronize before reduction

    // Begin reduction with loop unrolling
    for (int s = blockSize / 2; s > 32; s >>= 1)
    {
        if (tid < s)
        {
            if (sdata[tid] < sdata[tid + s])
            {
                if (checkDistance(smaxesRow, smaxesCol, nMax, idxData[tid + s], width))
                {
                    sdata[tid] = sdata[tid + s];
                    idxData[tid] = idxData[tid + s];
                }
            }
        }
        __syncthreads();
    }

    // Warp-level logic for the last 32 threads
    if (tid < 32)
    {
        volatile double *vdata = sdata;
        volatile int *vidxData = idxData;
        
        if (vdata[tid] < vdata[tid + 32])
        {
            if (checkDistance(smaxesRow, smaxesCol, nMax, vidxData[tid + 32], width))
            {
                vdata[tid] = vdata[tid + 32];
                vidxData[tid] = vidxData[tid + 32];
            }
        }
        if (vdata[tid] < vdata[tid + 16])
        {
            if (checkDistance(smaxesRow, smaxesCol, nMax, vidxData[tid + 16], width))
            {
                vdata[tid] = vdata[tid + 16];
                vidxData[tid] = vidxData[tid + 16];
            }
        }
        if (vdata[tid] < vdata[tid + 8])
        {
            if (checkDistance(smaxesRow, smaxesCol, nMax, vidxData[tid + 8], width))
            {
                vdata[tid] = vdata[tid + 8];
                vidxData[tid] = vidxData[tid + 8];
            }
        }
        if (vdata[tid] < vdata[tid + 4])
        {
            if (checkDistance(smaxesRow, smaxesCol, nMax, vidxData[tid + 4], width))
            {
                vdata[tid] = vdata[tid + 4];
                vidxData[tid] = vidxData[tid + 4];
            }
        }
        if (vdata[tid] < vdata[tid + 2])
        {
            if (checkDistance(smaxesRow, smaxesCol, nMax, vidxData[tid + 2], width))
            {
                vdata[tid] = vdata[tid + 2];
                vidxData[tid] = vidxData[tid + 2];
            }
        }
        if (vdata[tid] < vdata[tid + 1])
        {
            if (checkDistance(smaxesRow, smaxesCol, nMax, vidxData[tid + 1], width))
            {
                vdata[tid] = vdata[tid + 1];
                vidxData[tid] = vidxData[tid + 1];
            }
        }
    }
    
    // Write result for this block to global memory
    if (tid == 0)
    {
        g_odata[blockIdx.x] = sdata[0];
        max_idx[blockIdx.x] = idxData[0];
        
        if (gridDim.x == 1)
            maxes[nMax] = idxData[0];
    }
}