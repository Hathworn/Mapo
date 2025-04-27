#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int total_elements = (NX + NY) * B;

    // Use a stride loop to process all necessary elements
    for (; i < total_elements; i += blockDim.x * gridDim.x) {
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        if (j < NX) {
            if (X) X[b * NX + j] += OUT[i];  // Add OUT to X element
        } else {
            if (Y) Y[b * NY + j - NX] += OUT[i];  // Add OUT to Y element
        }
    }
}