#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel(float *d_M, float *d_N, float *d_P, int width) {
    // Allocate shared memory for input matrices
    __shared__ float M_tile[16][16];
    __shared__ float N_tile[16][16];

    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;
    float Pvalue = 0;

    // Loop over tiles
    for (int tile = 0; tile < (width + 15) / 16; ++tile) {
        // Load data into shared memory
        if (Row < width && tile * 16 + threadIdx.x < width) {
            M_tile[threadIdx.y][threadIdx.x] = d_M[Row * width + tile * 16 + threadIdx.x];
        } else {
            M_tile[threadIdx.y][threadIdx.x] = 0.0;
        }

        if (Col < width && tile * 16 + threadIdx.y < width) {
            N_tile[threadIdx.y][threadIdx.x] = d_N[(tile * 16 + threadIdx.y) * width + Col];
        } else {
            N_tile[threadIdx.y][threadIdx.x] = 0.0;
        }

        __syncthreads();

        // Compute partial product for the tile
        for (int i = 0; i < 16; ++i) {
            Pvalue += M_tile[threadIdx.y][i] * N_tile[i][threadIdx.x];
        }

        __syncthreads();
    }
    
    // Write back the result
    if (Row < width && Col < width) {
        d_P[Row * width + Col] = Pvalue;
    }
}