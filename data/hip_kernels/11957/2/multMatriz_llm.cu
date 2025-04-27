#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    // Calculate row and column for the current element
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;

    if (i < num && j < num) {  // Ensure within bounds
        float sum = 0.0f;  // Initialize sum
        for (unsigned int k = 0; k < num; k++) {
            // Accumulate the product
            sum += da[i * num + k] * db[k * num + j];
        }
        // Store the computed value
        dc[i * num + j] = sum;
    }
}