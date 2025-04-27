#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void magnitudeCopy(float *mag_vec, float *vec, const int n) {
    // Use shared memory for faster access
    __shared__ float sharedVec[1024];
    
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Load data into shared memory
    if (xIndex < n) {
        sharedVec[threadIdx.x] = vec[xIndex];
        __syncthreads(); // Ensure all threads have loaded data
        
        // Calculate magnitude
        mag_vec[xIndex] = abs(sharedVec[threadIdx.x]);
    }
}