#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    int stride = gridDim.x * blockDim.x; // Calculate the total stride

    while (i < (NX + NY) * B) { // Use loop to handle multiple elements per thread
        int b = i / (NX + NY);
        int j = i % (NX + NY);
        
        if (j < NX) {
            OUT[i] = X[b * NX + j];
        } else {
            OUT[i] = Y[b * NY + j - NX];
        }

        i += stride; // Move to the next element handled by this thread
    }
}