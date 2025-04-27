#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeTemporalSmoothRmatrices(const float* Rmatrices, uint32_t numSamples, uint32_t subArraySize, uint32_t numSubArrays, const uint32_t* subArraySizes, uint32_t temporalSmoothing, float* TempRmatrices)
{
    // Calculate sample index based on grid and block index
    int sampleIdx = blockIdx.y * gridDim.x + blockIdx.x;

    // Check if the sample index is within the valid range
    if (sampleIdx < numSamples)
    {
        int subArraySizeLocal = subArraySizes[sampleIdx];
        int numelR = subArraySizeLocal * subArraySizeLocal;
        int numelRfull = subArraySize * subArraySize;

        // Determine the temporal smoothing range
        int firstIdx = max(0, sampleIdx - (int)temporalSmoothing);
        int lastIdx = min((int)(numSamples) - 1, sampleIdx + (int)temporalSmoothing);

        float scaling = 1.0f;

        // Optimize by unrolling shared processing across threads
        for (int matrixIdx = threadIdx.y * blockDim.x + threadIdx.x; matrixIdx < numelR; matrixIdx += blockDim.x * blockDim.y)
        {
            int colIdx = matrixIdx % subArraySizeLocal;
            int rowIdx = matrixIdx / subArraySizeLocal;
            int matrixStorageIdx = colIdx + rowIdx * subArraySize;

            float finalEntry = 0.0f;

            // Accumulate contributions from temporal smoothing range
            for (int tempIdx = firstIdx; tempIdx <= lastIdx; tempIdx++)
            {
                finalEntry += Rmatrices[matrixStorageIdx + tempIdx * numelRfull];
            }

            // Store the computed value in the temporary matrix output
            TempRmatrices[matrixStorageIdx + sampleIdx * numelRfull] = finalEntry * scaling;
        }
    }
}