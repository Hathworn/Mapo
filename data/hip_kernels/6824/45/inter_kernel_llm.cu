#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use strided loop to allow more threads to efficiently process the data
    for (int index = i; index < (NX + NY) * B; index += gridDim.x * blockDim.x) {
        int b = index / (NX + NY);
        int j = index % (NX + NY);
        if (j < NX) {
            OUT[index] = X[b * NX + j];
        } else {
            OUT[index] = Y[b * NY + j - NX];
        }
    }
}