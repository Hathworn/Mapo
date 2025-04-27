#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    // Calculate row and column index for this thread
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure index is within bounds
    if (i < num && j < num) {
        float sum = 0.0f;
        // Perform matrix multiplication for this thread's row and column
        for (unsigned int k = 0; k < num; k++) {
            sum += da[i * num + k] * db[k * num + j];
        }
        // Store the result in the output matrix
        dc[i * num + j] = sum;
    }
}