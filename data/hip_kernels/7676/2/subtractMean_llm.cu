#include "hip/hip_runtime.h"
#include "includes.h"

// helper for CUDA error handling
__global__ void subtractMean(double* __restrict__ images, const double* __restrict__ meanImage, std::size_t imageNum, std::size_t pixelNum)
{
    std::size_t col = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (col >= pixelNum)
    {
        return;
    }
    
    // Use shared memory for meanImage if needed across threads
    // Optimize memory access pattern for coalescing
    for (std::size_t row = 0; row < imageNum; ++row)
    {
        std::size_t index = row * pixelNum + col;
        double newValue = images[index] - meanImage[col];
        
        // Directly assign the max operation result
        images[index] = newValue < 0.0 ? 0.0 : newValue;
    }
}