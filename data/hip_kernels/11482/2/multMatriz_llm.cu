#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    // Calculate global row index
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    // Calculate global column index
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure within bounds
    if (row < num && col < num) {
        // Initialize sum
        float sum = 0;
        // Calculate dot product for one element of the result matrix
        for (int k = 0; k < num; ++k) {
            sum += da[row * num + k] * db[k * num + col];
        }
        // Assign the computed value to the result matrix
        dc[row * num + col] = sum;
    }
}