#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fillUnusedDiagonal(float* Rmatrices, uint32_t numSamples, uint32_t subArraySize, const uint32_t* subArraySizes)
{
    // Calculate global thread index
    int tIdx = (blockIdx.y * gridDim.x + blockIdx.x) * (blockDim.x * blockDim.y) + (threadIdx.y * blockDim.x + threadIdx.x);

    int sampleIdx = tIdx / (blockDim.x * blockDim.y);
    int localTIdx = tIdx % (blockDim.x * blockDim.y);

    if (sampleIdx < numSamples)
    {
        int subArraySizeLocal = subArraySizes[sampleIdx];
        int numelRfull = subArraySize * subArraySize;

        if (subArraySize > subArraySizeLocal)
        {
            float* R = &Rmatrices[sampleIdx * numelRfull];
            float diagEntry = R[subArraySize * subArraySize - 1];

            for (int diagIdx = subArraySizeLocal + localTIdx; diagIdx < subArraySize; diagIdx += blockDim.x * blockDim.y)
            {
                // Efficient calculation for diagonal index
                int matrixIdx = diagIdx * (subArraySize + 1);
                R[matrixIdx] = diagEntry;
            }
        }
    }
}