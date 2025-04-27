#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeTemporalSmoothRmatrices(const float* Rmatrices, uint32_t numSamples, uint32_t subArraySize, uint32_t numSubArrays, const uint32_t* subArraySizes, uint32_t temporalSmoothing, float* TempRmatrices)
{
    // Use 1D blockIdx.y and threadIdx for better thread and memory access pattern
    int sampleIdx = blockIdx.x;
    int scanlineIdxLocal = blockIdx.y;
    int threadIndex = threadIdx.x + threadIdx.y * blockDim.x;
    int blockSize = blockDim.x * blockDim.y;

    if (sampleIdx < numSamples)
    {
        int subArraySizeLocal = subArraySizes[scanlineIdxLocal * numSamples + sampleIdx];
        if (subArraySizeLocal > 0)
        {
            int numelR = subArraySizeLocal * (subArraySizeLocal + 1) / 2;
            int numelRfull = subArraySize * (subArraySize + 1) / 2;

            // Calculate first and last index bounds for the temporal smoothing
            int firstIdx = max(0, sampleIdx - (int)temporalSmoothing) + scanlineIdxLocal * numSamples;
            int lastIdx = min((int)(numSamples) - 1, sampleIdx + (int)temporalSmoothing) + scanlineIdxLocal * numSamples;

            float scaling = 1.0f;

            for (int matrixIdx = threadIndex; matrixIdx < numelR; matrixIdx += blockSize)
            {
                float finalEntry = 0.0f;
                // Accumulate R matrices for temporal smoothing
                for (int tempIdx = firstIdx; tempIdx <= lastIdx; tempIdx++)
                {
                    finalEntry += Rmatrices[matrixIdx + tempIdx * numelRfull];
                }
                // Write the temporally smoothed result back
                TempRmatrices[matrixIdx + (scanlineIdxLocal * numSamples + sampleIdx) * numelRfull] = finalEntry * scaling;
            }
        }
    }
}