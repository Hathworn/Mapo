#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SumCentroids(float* delta, float* sumDelta, int numOfCentroids, int numOfElements)
{
    // Use blockDim.x * blockDim.y from grid stride loop to handle multiple blocks in one kernel
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    for (int idx = id; idx < numOfCentroids; idx += stride) 
    {
        float sum = 0;
        // Optimize memory access by contiguous access with stride
        for (int i = 0; i < numOfElements; i++) 
        {
            sum += delta[numOfElements * idx + i];
        }
        sumDelta[idx] = sum;
    }
}