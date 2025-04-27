#include "hip/hip_runtime.h"
#include "includes.h"

// helper for CUDA error handling
__global__ void getMeanImage(const double* images, double* meanImage, std::size_t imageNum, std::size_t pixelNum)
{
    std::size_t col = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (col >= pixelNum)
    {
        return;
    }

    // Utilize shared memory to reduce global memory access
    extern __shared__ double sharedImages[];

    double sum = 0.0;
    for (std::size_t row = 0; row < imageNum; ++row)
    {
        // Load image data into shared memory
        sharedImages[threadIdx.x] = images[row * pixelNum + col];
        __syncthreads();

        // Accumulate the sum of pixel values
        sum += sharedImages[threadIdx.x];
        __syncthreads();
    }

    // Compute the mean for each pixel
    meanImage[col] = sum / imageNum;
}