#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillUnusedDiagonal(float* Rmatrices, uint32_t numSamples, uint32_t subArraySize, const uint32_t* subArraySizes)
{
    // Optimizing thread index calculation for readability
    int tIdx = threadIdx.y * blockDim.x + threadIdx.x;
    int sampleIdx = blockIdx.y * gridDim.x + blockIdx.x;

    // Avoid redundant calculations and memory reads
    if (sampleIdx < numSamples)
    {
        int subArraySizeLocal = subArraySizes[sampleIdx];
        if (subArraySize > subArraySizeLocal)
        {
            int numelRfull = subArraySize * subArraySize;
            float* R = &Rmatrices[sampleIdx * numelRfull];

            // Pre-fetch diagEntry outside the loop for efficiency
            float diagEntry = R[subArraySize * subArraySize - 1];

            // Optimize loop by avoiding calls to blockDim.x*blockDim.y within it
            const int stride = blockDim.x * blockDim.y;
            for (int diagIdx = subArraySizeLocal + tIdx; diagIdx < subArraySize; diagIdx += stride)
            {
                // Calculate index more efficiently
                int matrixIdx = diagIdx * (subArraySize + 1);

                R[matrixIdx] = diagEntry;
            }
        }
    }
}