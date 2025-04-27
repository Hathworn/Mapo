#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel(float *Md, float *Nd, float *Pd, int Width) {
    // Use shared memory to reduce global memory accesses
    __shared__ float Mds[16][16]; // Assume 16x16 block size for illustration
    __shared__ float Nds[16][16];

    // 2D Thread ID
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int Row = blockIdx.y * blockDim.y + ty;
    int Col = blockIdx.x * blockDim.x + tx;

    float Pvalue = 0;

    // Iterate over tiles
    for (int t = 0; t < (Width + 15) / 16; ++t) {  // Assuming block width of 16
        // Load data into shared memory
        if (Row < Width && t * 16 + tx < Width) {
            Mds[ty][tx] = Md[Row * Width + t * 16 + tx];
        }
        if (Col < Width && t * 16 + ty < Width) {
            Nds[ty][tx] = Nd[(t * 16 + ty) * Width + Col];
        }

        __syncthreads(); // Synchronize to ensure tiles are loaded

        // Compute product for the current tile
        for (int k = 0; k < 16; ++k) {
            Pvalue += Mds[ty][k] * Nds[k][tx];
        }

        __syncthreads(); // Synchronize to ensure completion of calculation for this tile
    }

    // Write the result to global memory
    if (Row < Width && Col < Width) {
        Pd[Row * Width + Col] = Pvalue;
    }
}