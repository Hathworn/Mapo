#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillUnusedDiagonal(float* Rmatrices, uint32_t numSamples, uint32_t subArraySize, const uint32_t* subArraySizes)
{
    // Calculate global thread index
    int tIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int bIdx = blockIdx.y * gridDim.x + blockIdx.x;

    if (bIdx < numSamples)
    {
        int subArraySizeLocal = subArraySizes[bIdx];
        int numelRfull = subArraySize * subArraySize;

        if (subArraySize > subArraySizeLocal)
        {
            float* R = &Rmatrices[bIdx * numelRfull];
            float diagEntry = R[subArraySize * subArraySize - 1];

            for (int diagIdx = subArraySizeLocal + tIdx; diagIdx < subArraySize; diagIdx += blockDim.x * gridDim.x)
            {
                // Calculate the index for a diagonal element
                int matrixIdx = diagIdx * (subArraySize + 1);

                // Set diagonal entry
                R[matrixIdx] = diagEntry;
            }
        }
    }
}