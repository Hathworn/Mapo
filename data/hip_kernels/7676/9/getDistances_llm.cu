#include "hip/hip_runtime.h"
#include "includes.h"

// helper for CUDA error handling
__global__ void getDistances(const double* trainingWeights, const double* testWeights, double* distances, std::size_t trainImageNum, std::size_t testImageNum, std::size_t componentNum)
{
    std::size_t row = blockIdx.x;
    std::size_t col = blockIdx.y * blockDim.x + threadIdx.x;

    // Ensure threads are within bounds
    if (col < testImageNum && row < trainImageNum)
    {
        double sum = 0.0;
        // Use registers for faster computations
        #pragma unroll
        for (std::size_t i = 0; i < componentNum; ++i)
        {
            sum += fabs(trainingWeights[i * trainImageNum + row] - testWeights[i * testImageNum + col]);
        }
        distances[row * testImageNum + col] = sum;
    }
}