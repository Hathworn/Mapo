#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void KernelNormalMul(int *Mat1, int *Mat2, int *Mat3, int m, int n, int p) {
    int j = threadIdx.y + blockDim.y * blockIdx.y; // row
    int i = threadIdx.x + blockDim.x * blockIdx.x; // col

    // Ensure valid thread indices before proceeding
    if (j < m && i < p) {
        int value = 0;
        // Unroll loop for better memory access and coalescing
        for (int k = 0; k < n; k += 4) {
            if (k < n) value += Mat1[n * j + k] * Mat2[p * k + i];
            if (k + 1 < n) value += Mat1[n * j + (k + 1)] * Mat2[p * (k + 1) + i];
            if (k + 2 < n) value += Mat1[n * j + (k + 2)] * Mat2[p * (k + 2) + i];
            if (k + 3 < n) value += Mat1[n * j + (k + 3)] * Mat2[p * (k + 3) + i];
        }
        Mat3[p * j + i] = value;
    }
}