#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256
#define MIN_DISTANCE 1.0

// Efficient warp reduction using shared memory optimizations.
__global__ void reduce_max_filter_mainf(float *g_idata, float *g_odata, int * max_idx, unsigned int width, unsigned int height, int blockSize, int *maxes, int nMax)
{
    __shared__ int smaxesRow[10];
    __shared__ int smaxesCol[10];
    __shared__ int smaxesVal[10];
    __shared__ float sdata[THREADS_PER_BLOCK];
    __shared__ int idxData[THREADS_PER_BLOCK];
    
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockSize) + tid;
    unsigned int gridSize = blockSize * gridDim.x;

    if (tid < nMax)
    {
        smaxesVal[tid] = maxes[tid];
        smaxesRow[tid] = smaxesVal[tid] / width;
        smaxesCol[tid] = smaxesVal[tid] % width;
    }
    __syncthreads();

    float myMax = -INFINITY;
    int myMaxIndex;
    float val;

    while (i < width * height)
    {
        val = g_idata[i];
        if (myMax < val)
        {
            if (checkDistancef(smaxesRow, smaxesCol, nMax, i, width))
            {
                myMax = val;
                myMaxIndex = i;
            }
        }

        if (i + blockSize < width * height)
        {
            val = g_idata[i + blockSize];
            if (myMax < val)
            {
                if (checkDistancef(smaxesRow, smaxesCol, nMax, i + blockSize, width))
                {
                    myMax = val;
                    myMaxIndex = i + blockSize;
                }
            }
        }

        i += gridSize;
    }

    sdata[tid] = myMax;
    idxData[tid] = myMaxIndex;
    __syncthreads();

    // Improved reduction using a single warp
    if (tid < 32)
    {
        volatile float *vdata = sdata;
        volatile int *vidxData = idxData;

        for (int offset = 32; offset >= 1; offset /= 2)
        {
            if (myMax < vdata[tid + offset])
            {
                if (checkDistancef(smaxesRow, smaxesCol, nMax, vidxData[tid + offset], width))
                {
                    vdata[tid] = myMax = vdata[tid + offset];
                    vidxData[tid] = vidxData[tid + offset];
                }
            }
        }
    }

    // Only the first thread in a block writes the result
    if (tid == 0)
    {
        g_odata[blockIdx.x] = sdata[0];
        max_idx[blockIdx.x] = idxData[0];

        if (gridDim.x == 1)
            maxes[nMax] = idxData[0];
    }
}
```
