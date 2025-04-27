#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function to compute weights
__global__ void getWeights(const double* restoredEigenvectors, const double* meanSubtractedImages, double* weights, std::size_t imageNum, std::size_t pixelNum, std::size_t componentNum)
{
    std::size_t col = blockIdx.x * blockDim.x + threadIdx.x; // Optimize thread index calculation
    std::size_t row = blockIdx.y * blockDim.y + threadIdx.y; // Optimize block index calculation

    if (col >= imageNum || row >= componentNum)
    {
        return;
    }

    double sum = 0.0; // Use a local variable to accumulate results for better memory access
    for (std::size_t i = 0; i < pixelNum; ++i)
    {
        sum += restoredEigenvectors[row * pixelNum + i] * meanSubtractedImages[col * pixelNum + i];
    }

    weights[row * imageNum + col] = sum; // Write the accumulated result to global memory
}