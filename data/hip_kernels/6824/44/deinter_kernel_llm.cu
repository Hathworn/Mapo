#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Use 1D grid for computing i
    int totalSize = (NX + NY) * B;
    int stride = gridDim.x * blockDim.x;  // Calculate stride for grid-stride loop

    for (; i < totalSize; i += stride) {  // Grid-stride loop for better utilization
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        if (j < NX) {
            if (X) X[b * NX + j] += OUT[i];  // Simplified conditional operation
        } else {
            if (Y) Y[b * NY + j - NX] += OUT[i];  // Simplified conditional operation
        }
    }
}