#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    // Calculate global row and column indices
    int i = threadIdx.y + blockIdx.y * blockDim.y;
    int j = threadIdx.x + blockIdx.x * blockDim.x;

    // Use local registers for sum and loop variable
    float sum = 0.0f;
    if (i < num && j < num) {
        for (unsigned int k = 0; k < num; k++) {
            sum += da[i * num + k] * db[k * num + j];
        }
        dc[i * num + j] = sum;
    }
}