#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillUnusedDiagonal(float* Rmatrices, uint32_t numSamples, uint32_t subArraySize, const uint32_t* subArraySizes)
{
    int tIdx = threadIdx.x + blockDim.x * threadIdx.y; // Unique thread index within the block
    int sampleIdx = blockIdx.x + gridDim.x * blockIdx.y; // Adjusted to flatten blockIdx

    if (sampleIdx < numSamples)
    {
        int subArraySizeLocal = subArraySizes[sampleIdx];
        if (subArraySize > subArraySizeLocal)
        {
            int numelRfull = subArraySize * subArraySize;
            float* R = &Rmatrices[sampleIdx * numelRfull];
            float diagEntry = R[numelRfull - 1]; // Fetch once outside loop

            for (int diagIdx = subArraySizeLocal + tIdx; diagIdx < subArraySize; diagIdx += blockDim.x * blockDim.y)
            {
                int matrixIdx = diagIdx * (subArraySize + 1); // Compute flattened index for diagonal
                R[matrixIdx] = diagEntry; // Set unused diagonal entries
            }
        }
    }
}