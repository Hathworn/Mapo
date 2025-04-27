#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Calculate thread id
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    // Initialize accumulator to avoid repeated indexing in Pd
    float Pvalue = 0;

    // Use a single unrolled loop if possible for better performance
    for (int k = 0; k < WIDTH; k++) {
        Pvalue += Md[row * WIDTH + k] * Nd[k * WIDTH + col];
    }

    // Write computed value once at the end
    Pd[row * WIDTH + col] = Pvalue;
}