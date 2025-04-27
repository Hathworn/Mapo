#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TwoNodesDistanceKernel(float *twoNodesDifference, float *twoNodesDistance, int vectorLength)
{
    // Optimize threadId calculation
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure only the first thread computes the distance
    if (threadId == 0)
    {
        float sum = 0.0f;
        // Unroll loop for better performance
        #pragma unroll
        for (int i = 0; i < vectorLength; i++)
        {
            float value = twoNodesDifference[i];
            sum += value * value;
        }
        twoNodesDistance[0] = sqrtf(sum);
    }
}