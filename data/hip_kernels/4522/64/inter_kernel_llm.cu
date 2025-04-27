#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x 
            + blockIdx.y * gridDim.x * blockDim.x;

    // Use local variables for calculations to reduce memory access
    const int totalXY = NX + NY;

    if (i < totalXY * B) {
        int b = i / totalXY;
        int j = i % totalXY;

        // Optimize conditional branch
        OUT[i] = (j < NX) ? X[b * NX + j] : Y[b * NY + j - NX];
    }
}