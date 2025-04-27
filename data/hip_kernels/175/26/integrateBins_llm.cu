```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void integrateBins(int width, int height, int nbins, int* devImage, int binPitch, int* devIntegrals) {
    __shared__ int pixels[16];
    const int blockX = blockDim.y * blockIdx.x;
    const int threadX = threadIdx.y;
    const int bin = threadIdx.x;
    const int x = blockX + threadX;
    
    // Boundary check for valid x and bin
    if (x >= width || bin >= nbins) return;
    
    int accumulant = 0;
    int* imagePointer = devImage + x;
    int* outputPointer = devIntegrals + binPitch * x + bin;
    
    for (int y = 0; y < height; y++) {
        // Load pixels once per row into shared memory
        if (bin == 0) {
            pixels[threadX] = *imagePointer;
        }
        __syncthreads();
        
        // Using shared memory for caching pixel values
        if (pixels[threadX] == bin) accumulant++;
        
        *outputPointer = accumulant;
        imagePointer += width;
        outputPointer += width * binPitch;
    }
}