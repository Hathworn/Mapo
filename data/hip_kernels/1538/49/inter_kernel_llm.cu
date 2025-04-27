#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    int totalThreads = gridDim.x * blockDim.x; // Calculate total number of threads

    for (int i = idx; i < (NX + NY) * B; i += totalThreads) { // Use loop to allow other threads to work concurrently
        int b = i / (NX + NY);
        int j = i % (NX + NY);
        if (j < NX) {
            OUT[i] = X[b * NX + j];
        } else {
            OUT[i] = Y[b * NY + j - NX];
        }
    }
}