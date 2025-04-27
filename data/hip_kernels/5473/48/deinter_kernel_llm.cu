#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use strided loop to allow better utilization of threads
    for (; i < (NX + NY) * B; i += stride) {
        int b = i / (NX + NY);
        int j = i % (NX + NY);
        
        if (j < NX) {
            if (X) X[b * NX + j] += OUT[i];
        } else {
            if (Y) Y[b * NY + j - NX] += OUT[i];
        }
    }
}