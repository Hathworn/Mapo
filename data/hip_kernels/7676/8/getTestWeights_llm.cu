#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getTestWeights(const double* restoredEigenvectors, const double* meanImage, const double* testImages, double* testWeights, std::size_t testImageNum, std::size_t pixelNum, std::size_t componentNum)
{
    std::size_t row = blockIdx.x;
    std::size_t col = blockIdx.y * blockDim.x + threadIdx.x;

    // Check bounds
    if (col >= testImageNum || row >= componentNum) {
        return;
    }

    double weight = 0.0;
    for (std::size_t i = 0; i < pixelNum; ++i) {
        double testImagePixelValue = testImages[col * pixelNum + i] - meanImage[i];
        // Directly zero negative values
        if (testImagePixelValue < 0.0) {
            testImagePixelValue = 0.0;
        }
        weight += restoredEigenvectors[row * pixelNum + i] * testImagePixelValue;
    }

    // Write final weight once per row-column pair
    testWeights[row * testImageNum + col] = weight;
}