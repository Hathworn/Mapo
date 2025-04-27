#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    float sum = 0;
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;

    // Loop over rows
    for (int row = i; row < num; row += gridDim.y * blockDim.y) {
        // Loop over columns
        for (int col = j; col < num; col += gridDim.x * blockDim.x) {
            sum = 0; // Reset sum for each element
            // Compute dot product
            for (unsigned int k = 0; k < num; k++) {
                sum += da[row * num + k] * db[k * num + col];
            }
            dc[row * num + col] = sum;
        }
    }
}