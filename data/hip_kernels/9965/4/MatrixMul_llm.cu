#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatrixMul( float *Md , float *Nd , float *Pd , const int WIDTH )
{
    // calculate thread id
    unsigned int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    unsigned int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    // Ensure within matrix bounds
    if (col < WIDTH && row < WIDTH) {
        float Pvalue = 0.0; // Use register to accumulate results
        for (int k = 0; k < WIDTH; k++) {
            Pvalue += Md[row * WIDTH + k] * Nd[k * WIDTH + col];
        }
        Pd[row * WIDTH + col] = Pvalue; // Store result
    }
}
```
