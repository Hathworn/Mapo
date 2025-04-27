#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelCalculateHistogram(unsigned int* histogram, unsigned char* rawPixels, long chunkSize, long totalPixels)
{
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Calculate stride

    for (int i = id * chunkSize; i < totalPixels; i += stride * chunkSize) {
        int end = min(i + chunkSize, totalPixels);  // Calculate end to prevent overstepping
        for (int j = i; j < end; ++j) {
            int pixelValue = (int)rawPixels[j];
            atomicAdd(&histogram[pixelValue], 1);
        }
    }
}