#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeL2Distance(float *corrData, int numPts1) {
    // Calculate global point index
    const int p1 = blockIdx.x * blockDim.x + threadIdx.x;
    const int p2 = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check bounds for p1
    if (p1 < numPts1) {
        const int idx = p1 * gridDim.y * blockDim.y + p2;
        
        // Use a conditional operator for conciseness
        corrData[idx] = (corrData[idx] > -1) ? (2 - 2 * corrData[idx]) : FLT_MAX;
    }
}