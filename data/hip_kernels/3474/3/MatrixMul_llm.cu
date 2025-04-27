#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatrixMul(float *darray_1, float *darray_2 , float *dres_arr, int n) {
    // Calculate row and column indices
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure the thread is within matrix boundaries
    if (row < n && col < n) {
        float sum = 0.0f; // Use a local variable for accumulation
        for (int i = 0; i < n; i++) {
            sum += darray_1[row * n + i] * darray_2[i * n + col];
        }
        dres_arr[row * n + col] = sum; // Write the result to global memory
    }
}