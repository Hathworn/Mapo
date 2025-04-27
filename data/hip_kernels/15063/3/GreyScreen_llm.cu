#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GreyScreen(float* d_pixelsR, float* d_pixelsG, float* d_pixelsB, float* d_reducePixels, int numPixels) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check bounds to ensure valid access
    if (id < numPixels) {
        // Compute the average directly for greyscale
        d_reducePixels[id] = (d_pixelsR[id] + d_pixelsG[id] + d_pixelsB[id]) / 3.0f;
    }
}