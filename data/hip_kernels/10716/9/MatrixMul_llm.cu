#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatrixMul( float *Md , float *Nd , float *Pd , const int WIDTH )
{
    // Calculate thread id
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;
    
    // Ensure position is within bounds
    if (row < WIDTH && col < WIDTH) {
        float Pvalue = 0.0f;
        // Optimize memory access by using local variable for result
        for (int k = 0; k < WIDTH; ++k) {
            Pvalue += Md[row * WIDTH + k] * Nd[k * WIDTH + col];
        }
        Pd[row * WIDTH + col] = Pvalue;
    }
}