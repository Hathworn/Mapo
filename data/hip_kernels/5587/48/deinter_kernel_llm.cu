#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation for 'i'
    int b = blockIdx.y; // Separate dimension for batches

    if(i < NX + NY) { // Reduced boundary check
        int idx = b * (NX + NY) + i; // Calculate full offset
        if (i < NX) {
            if (X) X[b * NX + i] += OUT[idx]; // Use calculated idx
        } else {
            if (Y) Y[b * NY + i - NX] += OUT[idx]; // Use calculated idx
        }
    }
}