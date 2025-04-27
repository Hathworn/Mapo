#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void integrateBins(int width, int height, int nbins, int* devImage, int binPitch, int* devIntegrals) {
    __shared__ int pixels[16];
    const int blockX = blockDim.y * blockIdx.x;
    const int threadX = threadIdx.y;
    const int bin = threadIdx.x;
    const int x = blockX + threadX;
    
    // Exit if block-level `x` coordinate exceeds image width
    if (x >= width || bin >= nbins) return;
    
    int* imagePointer = devImage + x;
    int* outputPointer = devIntegrals + binPitch * x + bin;
    int accumulant = 0;
    
    // Iterate over image rows
    for (int y = 0; y < height; y++) {
        // Each block initializes shared memory for its portion
        if (bin == 0) {
            pixels[threadX] = *imagePointer;
        }
        
        // Wait for all threads to load current pixel row
        __syncthreads();
        
        // Check for bin match and accumulate
        if (pixels[threadX] == bin) {
            accumulant++;
        }
        
        // Store accumulator value in output
        *outputPointer = accumulant;
        
        // Move to next row in memory
        imagePointer += width;
        outputPointer += width * binPitch;
    }
}