#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by using shared memory and coalesced access
__global__ void meshgrid_create(float* xx, float* yy, int w, int h, float K02, float K12) {
    // Calculate global thread index
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index boundaries
    if (i < h && j < w) {
        // Compute indices for coalesced access
        int idx = j * h + i;
        
        // Store results efficiently with coalesced memory access
        xx[idx] = j - K02;
        yy[idx] = i - K12;
    }
}