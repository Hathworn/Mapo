#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    int total = (NX + NY) * B;

    if(i < total){
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        // Use ternary operator for cleaner if-else logic
        if (j < NX) {
            if (X)  X[b * NX + j] += OUT[i];
        } else {
            if (Y)  Y[b * NY + j - NX] += OUT[i];
        }
    }
}