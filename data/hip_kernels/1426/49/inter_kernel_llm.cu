#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    int blockStride = gridDim.x * blockDim.x;

    while (i < (NX + NY) * B) { // Loop over necessary indices
        int b = i / (NX + NY);
        int j = i % (NX + NY);
        if (j < NX) {
            OUT[i] = X[b * NX + j];
        } else {
            OUT[i] = Y[b * NY + j - NX];
        }
        i += blockStride; // Move to the next relevant index
    }
}