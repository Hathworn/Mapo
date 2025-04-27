#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeTemporalSmoothRmatrices(const float* Rmatrices, uint32_t numSamples, uint32_t subArraySize, uint32_t numSubArrays, const uint32_t* subArraySizes, uint32_t temporalSmoothing, float* TempRmatrices)
{
    // Calculate thread index and sample index
    int tIdx = (threadIdx.y * blockDim.x) + threadIdx.x;
    int sampleIdx = blockIdx.x;
    int scanlineIdxLocal = blockIdx.y;

    // Check if the current sample index is valid
    if (sampleIdx < numSamples)
    {
        // Get the local size of the sub-array
        int subArraySizeLocal = subArraySizes[scanlineIdxLocal * numSamples + sampleIdx];
        if (subArraySizeLocal > 0)
        {
            int numelR = subArraySizeLocal * (subArraySizeLocal + 1) / 2;
            int numelRfull = subArraySize * (subArraySize + 1) / 2;

            // Calculate the starting and ending indices for the temporal smoothing window
            int firstIdx = max(0, sampleIdx - (int)(temporalSmoothing)) + scanlineIdxLocal * numSamples;
            int lastIdx = min((int)(numSamples) - 1, sampleIdx + (int)(temporalSmoothing)) + scanlineIdxLocal * numSamples;

            float scaling = 1.0f;
            // Optimize by coalesced memory access and loop unrolling
            for (int matrixIdx = tIdx; matrixIdx < numelR; matrixIdx += blockDim.x * blockDim.y)
            {
                float finalEntry = 0.0f;
                for (int tempIdx = firstIdx; tempIdx <= lastIdx; tempIdx++)
                {
                    finalEntry += Rmatrices[matrixIdx + tempIdx * numelRfull];
                }
                // Write result to global memory
                TempRmatrices[matrixIdx + (scanlineIdxLocal * numSamples + sampleIdx) * numelRfull] = finalEntry * scaling;
            }
        }
    }
}