#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FloatDiv(float *A, float *B, float *C)
{
    unsigned int i = blockIdx.x * blockDim.x * blockDim.y * blockDim.z  // Simplified index calculation
                    + blockIdx.y * blockDim.y * blockDim.z
                    + blockIdx.z * blockDim.z
                    + threadIdx.z * blockDim.y * blockDim.x 
                    + threadIdx.y * blockDim.x 
                    + threadIdx.x;

    // Perform boundary check
    unsigned int totalThreads = gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z;
    if (i < totalThreads) {
        C[i] = (B[i] != 0) ? A[i] / B[i] : 0;
    }
}