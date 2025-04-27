#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeDistanceKernel( float *symbolVectors, float *inputVector, float *distance, int symbolSize, int symbols )
{
    int symbolId = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread index calculation
    
    if(symbolId < symbols)
    {
        float sum = 0.0f; // Initialize the sum variable
        float *symbolVector = symbolVectors + symbolId * symbolSize; // Pointer to the current symbol vector

        for(int i = 0; i < symbolSize; i++)
        {
            sum += symbolVector[i] * inputVector[i]; // Load and multiply elements directly
        }
        
        distance[symbolId] = sum; // Store the computed distance
    }
}