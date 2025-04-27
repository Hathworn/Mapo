#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation within a single dimension.
    int elements = (NX + NY) * B;  // Calculate total elements only once.
    if (i < elements) {
        int b = i / (NX + NY);
        int j = i % (NX + NY);
        if (j < NX) {
            if (X) X[b * NX + j] += OUT[i];  // Accumulate OUT to X.
        } else {
            if (Y) Y[b * NY + j - NX] += OUT[i];  // Accumulate OUT to Y.
        }
    }
}