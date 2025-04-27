#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalization(int *glcm, float *norm, int max, int sum) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * max + ix;
    
    // Ensure threads sync before any operation
    __syncthreads();
    
    // Efficient boundary check
    if (ix < max && iy < max) {
        norm[idx] = static_cast<float>(glcm[idx]) / sum;  // Use static_cast for clarity
    }
}