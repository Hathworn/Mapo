#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *out)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Check if thread index is within bounds
    if (i < (NX + NY) * B) {
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        // Perform element-wise operation with boundary check
        if (j < NX && X) {
            X[b * NX + j] += out[i];
        } else if (Y) {
            Y[b * NY + j - NX] += out[i];
        }
    }
}