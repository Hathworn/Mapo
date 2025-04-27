#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    // Compute global row and column indices
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;

    if (i < num && j < num) { // Ensure thread is within matrix bounds
        float sum = 0.0f;
        for (unsigned int k = 0; k < num; k++) {
            sum += da[i * num + k] * db[k * num + j];
        }
        dc[i * num + j] = sum;
    }
}