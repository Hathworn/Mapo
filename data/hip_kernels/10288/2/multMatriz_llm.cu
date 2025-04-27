#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multMatriz(float *da, float *db, float *dc, int num) {
    float sum = 0;
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;

    // Avoid unnecessary loops by directly checking thread bounds
    if (i < num && j < num) {
        for (unsigned int k = 0; k < num; k++)
            sum += da[i * num + k] * db[k * num + j];
        dc[i * num + j] = sum;
    }
}