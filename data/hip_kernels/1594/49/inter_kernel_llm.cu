#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = gridDim.x * blockDim.x;
    
    // Unroll loop for better performance
    for (int idx = i; idx < (NX + NY) * B; idx += totalThreads) {
        int b = idx / (NX + NY);
        int j = idx % (NX + NY);
        if (j < NX) {
            OUT[idx] = X[b * NX + j];
        } else {
            OUT[idx] = Y[b * NY + j - NX];
        }
    }
}