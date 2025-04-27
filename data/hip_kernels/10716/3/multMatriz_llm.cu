#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    // Calculate global index for matrix element
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure within matrix bounds
    if(i < num && j < num) {
        float sum = 0.0f; // Initialize sum for dot product
        // Perform dot product for element (i, j)
        for (unsigned int k = 0; k < num; k++) {
            sum += da[i * num + k] * db[k * num + j];
        }
        dc[i * num + j] = sum; // Store result in matrix C
    }
}