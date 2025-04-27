#include "hip/hip_runtime.h"
#include "includes.h"

// Helper for CUDA error handling
__global__ void restoreEigenvectors(const double* meanSubtractedImages, const double* reducedEigenvectors, double* restoredEigenvectors, std::size_t imageNum, std::size_t pixelNum, std::size_t componentNum) {
    std::size_t col = blockIdx.x * blockDim.x + threadIdx.x; // Optimize col calculation by using blockIdx.x
    std::size_t row = blockIdx.y * blockDim.y + threadIdx.y; // Optimize row calculation by using blockIdx.y

    // Boundary check
    if (col >= pixelNum || row >= componentNum) return;
    
    // Initialize value for each thread
    double sum = 0.0;
    
    // Perform calculation
    for (std::size_t i = 0; i < imageNum; ++i) {
        sum += reducedEigenvectors[(imageNum - row - 1) * imageNum + i] * meanSubtractedImages[i * pixelNum + col];
    }
    
    // Write the result
    restoredEigenvectors[row * pixelNum + col] = sum;
}