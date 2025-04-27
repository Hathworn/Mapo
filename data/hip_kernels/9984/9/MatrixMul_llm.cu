#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Calculate thread id
    unsigned int col = blockIdx.x * TILE_WIDTH + threadIdx.x;
    unsigned int row = blockIdx.y * TILE_WIDTH + threadIdx.y;
    
    // Ensure indices are within bounds
    if (row < WIDTH && col < WIDTH) {
        float Pvalue = 0;
        for (int k = 0; k < WIDTH; ++k) {
            Pvalue += Md[row * WIDTH + k] * Nd[k * WIDTH + col];
        }
        Pd[row * WIDTH + col] = Pvalue; // Store result in Pd
    }
}