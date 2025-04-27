#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 16

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Calculate thread ID
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    // Boundary check to ensure valid memory access
    if (row < WIDTH && col < WIDTH) {
        float Pvalue = 0; // Accumulator for the sum
        for (int k = 0; k < WIDTH; k++) {
            Pvalue += Md[row * WIDTH + k] * Nd[k * WIDTH + col];
        }
        Pd[row * WIDTH + col] = Pvalue; // Store result
    }
}