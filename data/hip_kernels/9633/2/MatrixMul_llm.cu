#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Calculate thread id
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    // Initialize accumulation variable
    float Pvalue = 0.0f;

    // Perform the dot product for a single element
    for (int k = 0; k < WIDTH; k++) {
        Pvalue += Md[row * WIDTH + k] * Nd[k * WIDTH + col];
    }

    // Store the result
    Pd[row * WIDTH + col] = Pvalue;
}