#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeTemporalSmoothRmatrices(const float* Rmatrices, uint32_t numSamples, uint32_t subArraySize, uint32_t numSubArrays, const uint32_t* subArraySizes, uint32_t temporalSmoothing, float* TempRmatrices)
{
    // Calculate thread index and sample index
    int tIdx = threadIdx.x + blockDim.x * threadIdx.y;
    int sampleIdx = blockIdx.x + blockIdx.y * gridDim.x;
    
    // Ensure we are within bounds
    if (sampleIdx >= numSamples) return;

    int subArraySizeLocal = subArraySizes[sampleIdx];
    int numelR = subArraySizeLocal * subArraySizeLocal;
    int numelRfull = subArraySize * subArraySize;

    // Calculate temporal index bounds
    int firstIdx = max(0, sampleIdx - (int)(temporalSmoothing));
    int lastIdx = min((int)(numSamples) - 1, sampleIdx + (int)(temporalSmoothing));

    // Scaling factor (keeping it but might be redundant)
    float scaling = 1.0f;

    // Optimize memory access by ensuring contiguous memory access through tIdx increment
    for (int matrixIdx = tIdx; matrixIdx < numelR; matrixIdx += blockDim.x * blockDim.y)
    {
        int colIdx = matrixIdx % subArraySizeLocal;
        int rowIdx = matrixIdx / subArraySizeLocal;
        int matrixStorageIdx = colIdx + rowIdx * subArraySize;

        float finalEntry = 0.0f;

        // Summing temporally smoothed R matrix values
        for (int tempIdx = firstIdx; tempIdx <= lastIdx; tempIdx++)
        {
            finalEntry += Rmatrices[matrixStorageIdx + tempIdx * numelRfull];
        }

        // Store the result
        TempRmatrices[matrixStorageIdx + sampleIdx * numelRfull] = finalEntry * scaling;
    }
}