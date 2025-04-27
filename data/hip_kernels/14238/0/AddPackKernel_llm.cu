#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int GetVecIndex(int vecNumber, int dimCount, int *dimSizes, int measCount, int vecCount, int *dims)
{
    unsigned long int index = 0;

    for (int i = 0; i < dimCount; ++i)
        index += (unsigned long int)dimSizes[i] * (unsigned long int)dims[i * vecCount + vecNumber];

    return index;
}

__global__ void AddPackKernel(unsigned long int *codes, int *measures, int dimensionsCount, int *dimendionsSizes, int measuresCount, int currentCapacity, int fullCapacity, int packCount, int *packDimensions, int *packMeasures)
{
    int currentVec = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Precompute stride

    while (currentVec < packCount)
    {
        // Optimize redundant memory accesses
        int vecIndex = GetVecIndex(currentVec, dimensionsCount, dimendionsSizes, measuresCount, packCount, packDimensions);
        codes[currentCapacity + currentVec] = vecIndex;

        for (int i = 0; i < measuresCount; ++i)
        {
            int measureIndex = i * fullCapacity + currentCapacity + currentVec;
            measures[measureIndex] = packMeasures[i * packCount + currentVec];
        }

        currentVec += stride;
    }
}