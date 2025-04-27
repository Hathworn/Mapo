#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified block index calculation
    int gridStride = blockDim.x * gridDim.x;  // Calculate grid stride to allow more iterations per thread
    
    while (i < (NX + NY) * B) {  // Use grid-stride loop for handling multiple elements per thread
        int b = i / (NX + NY);
        int j = i % (NX + NY);
        if (j < NX) {
            OUT[i] = X[b * NX + j];
        } else {
            OUT[i] = Y[b * NY + j - NX];
        }
        i += gridStride;  // Move to the next element managed by this thread
    }
}