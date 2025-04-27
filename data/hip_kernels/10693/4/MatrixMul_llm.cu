#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMul(float *Md, float *Nd, float *Pd, const int WIDTH) {
    // Calculate thread id
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    // Temporary variable for accumulating the result
    float Pvalue = 0;

    // Optimize loop by reducing global memory accesses
    for (int k = 0; k < WIDTH; k++) {
        Pvalue += Md[row * WIDTH + k] * Nd[k * WIDTH + col];
    }

    // Write the result to global memory
    Pd[row * WIDTH + col] = Pvalue;
}