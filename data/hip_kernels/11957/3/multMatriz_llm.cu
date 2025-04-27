#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    // Calculate global row (i) and column (j) index
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;
    
    if (i < num && j < num) { // Ensure only valid threads perform computation
        float sum = 0; // Reset sum for each matrix element calculation

        // Perform matrix multiplication for element (i, j)
        for (unsigned int k = 0; k < num; k++) {
            sum += da[i * num + k] * db[k * num + j];
        }

        // Store result in the output matrix
        dc[i * num + j] = sum;
    }
}