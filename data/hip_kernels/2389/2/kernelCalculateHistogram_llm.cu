#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelCalculateHistogram(unsigned int* histogram, unsigned char* rawPixels, long chunkSize, long totalPixels)
{
    int id = blockDim.x * blockIdx.x + threadIdx.x;

    // Calculate stride based on total number of threads
    int stride = blockDim.x * gridDim.x; 

    // Loop with stride to allow all threads to participate
    for (int i = id * chunkSize; i < totalPixels; i += stride * chunkSize) {
        int end = min(i + chunkSize, totalPixels);
        for (int j = i; j < end; j++) {
            int pixelValue = (int)rawPixels[j];
            atomicAdd(&histogram[pixelValue], 1);
        }
    }
}