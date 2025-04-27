#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Optimize by calculating the effective index once
    int i = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;

    // Check bounds of i
    if (i < (NX + NY) * B) {
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        // Reduce branching by checking X or Y presence outside condition
        if (j < NX) {
            if (X) {
                X[b * NX + j] += OUT[i];
            }
        } else {
            if (Y) {
                Y[b * NY + j - NX] += OUT[i];
            }
        }
    }
}