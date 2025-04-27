```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (i < (NX + NY) * B) {
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        // Choose the correct source array based on the value of j
        OUT[i] = (j < NX) ? X[b * NX + j] : Y[b * NY + j - NX];
    }
}