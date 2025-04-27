#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    // Calculate unique global thread indices for rows and columns
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure thread operates within matrix bounds
    if (i < num && j < num) {
        float sum = 0;
        // Perform matrix multiplication for the current row and col
        for (unsigned int k = 0; k < num; k++)
            sum += da[i * num + k] * db[k * num + j];
        // Store the result in the output matrix
        dc[i*num + j] = sum;
    }
}