#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid for simplicity
    int totalThreads = gridDim.x * blockDim.x; // Total number of threads
    int totalElements = (NX + NY) * B; // Total number of elements to process

    for (int idx = i; idx < totalElements; idx += totalThreads) { // Strided loop for workload distribution
        int b = idx / (NX + NY);
        int j = idx % (NX + NY);

        if (j < NX) {
            OUT[idx] = X[b * NX + j]; // Assign from X array
        } else {
            OUT[idx] = Y[b * NY + j - NX]; // Assign from Y array
        }
    }
}