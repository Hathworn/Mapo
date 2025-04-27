#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SumCentroids(float* delta, float* sumDelta, int numOfCentroids, int numOfElements)
{
    // Calculate unique thread id
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure id is within valid range
    if (id < numOfCentroids * NUM_SUMS)
    {
        float sum = 0;
        int offset = id * numOfElements;

        // Optimize loop by unrolling for better memory access patterns (assumes numOfElements is a multiple of 4)
        for (int i = 0; i < numOfElements; i += 4)
        {
            sum += delta[offset + i];
            sum += delta[offset + i + 1];
            sum += delta[offset + i + 2];
            sum += delta[offset + i + 3];
        }
        sumDelta[id] = sum;
    }
}