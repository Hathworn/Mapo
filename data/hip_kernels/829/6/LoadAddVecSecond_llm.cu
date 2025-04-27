#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LoadAddVecSecond(float *vector, float2 *FFT) {
    // Calculate global index for each thread in the grid
    int idx = threadIdx.x + blockIdx.x * blockDim.x; 

    // Load vector value once for better memory access efficiency
    float vecVal = vector[idx] / sqV;

    // Perform scaling on FFT components
    FFT[idx].x *= vecVal;
    FFT[idx].y *= vecVal;
}