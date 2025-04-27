#include "hip/hip_runtime.h"
#include "includes.h"

#define M  256
#define P  128
#define N   64
#define BLKSIZ 16

__global__ void mat_mul(float *Ad, float *Bd, float *Cd) {
    // Get global row and column indexes
    int Row = blockIdx.x * blockDim.x + threadIdx.x;
    int Col = blockIdx.y * blockDim.y + threadIdx.y;

    float c = 0.0f;

    // Shared memory for tiles of A and B
    __shared__ float As[BLKSIZ][BLKSIZ];
    __shared__ float Bs[BLKSIZ][BLKSIZ];

    // Iterate over tiles
    for (int t = 0; t < (P + BLKSIZ - 1) / BLKSIZ; ++t) {
        // Load tiles into shared memory
        if (Row < M && t * BLKSIZ + threadIdx.y < P) {
            As[threadIdx.x][threadIdx.y] = Ad[Row * P + t * BLKSIZ + threadIdx.y];
        } else {
            As[threadIdx.x][threadIdx.y] = 0.0f;
        }
        
        if (Col < N && t * BLKSIZ + threadIdx.x < P) {
            Bs[threadIdx.x][threadIdx.y] = Bd[(t * BLKSIZ + threadIdx.x) * N + Col];
        } else {
            Bs[threadIdx.x][threadIdx.y] = 0.0f;
        }

        __syncthreads();

        // Perform the computation
        for (int k = 0; k < BLKSIZ; ++k) {
            c += As[threadIdx.x][k] * Bs[k][threadIdx.y];
        }
        __syncthreads();
    }

    // Write the result
    if (Row < M && Col < N) {
        Cd[Row * N + Col] = c;
    }
}