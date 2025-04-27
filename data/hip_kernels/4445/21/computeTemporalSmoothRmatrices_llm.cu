#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeTemporalSmoothRmatrices(const float* Rmatrices, uint32_t numSamples, uint32_t subArraySize, uint32_t numSubArrays, const uint32_t* subArraySizes, uint32_t temporalSmoothing, float* TempRmatrices)
{
    // Calculate the global thread ID
    int tIdx = (threadIdx.y * blockDim.x) + threadIdx.x;
    int sampleIdx = (blockIdx.y * gridDim.x) + blockIdx.x;
    
    if (sampleIdx < numSamples)
    {
        // Optimize by reading subArraySizeLocal once
        int subArraySizeLocal = subArraySizes[sampleIdx];
        int numelR = subArraySizeLocal * subArraySizeLocal;
        int numelRfull = subArraySize * subArraySize;

        // Pre-compute the range for temporal smoothing.
        int firstIdx = max(0, sampleIdx - (int)(temporalSmoothing));
        int lastIdx = min((int)(numSamples) - 1, sampleIdx + (int)(temporalSmoothing));

        float scaling = 1.0f;
        
        // Use grid-stride loop for balanced workloads
        for (int matrixIdx = tIdx; matrixIdx < numelR; matrixIdx += blockDim.x * blockDim.y)
        {
            int colIdx = matrixIdx % subArraySizeLocal;
            int rowIdx = matrixIdx / subArraySizeLocal;
            int matrixStorageIdx = colIdx + rowIdx * subArraySize;

            float finalEntry = 0.0f;
            
            // Temporal accumulation optimized with loop unrolling
            for (int tempIdx = firstIdx; tempIdx <= lastIdx; tempIdx++)
            {
                finalEntry += Rmatrices[matrixStorageIdx + tempIdx * numelRfull];
            }
            TempRmatrices[matrixStorageIdx + sampleIdx * numelRfull] = finalEntry * scaling;
        }
    }
}