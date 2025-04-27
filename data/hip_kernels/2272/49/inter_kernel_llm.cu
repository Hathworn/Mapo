#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x; 

    // Check if within bounds
    if(i < (NX + NY) * B) {
        int b = i / (NX + NY);
        int j = i % (NX + NY);
        
        // Use ternary operator for simplicity
        OUT[i] = (j < NX) ? X[b * NX + j] : Y[b * NY + j - NX];
    }
}