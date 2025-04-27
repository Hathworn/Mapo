#include "hip/hip_runtime.h"
#include "includes.h"
#define TILE_SIZE 16

__global__ void computeMoment(int8_t *readArr, int8_t *writeArr, float *weightArr, int n, int tileSize) {
    int row_init = blockIdx.x * (blockDim.x * tileSize) + threadIdx.x * tileSize;
    int col_init = blockIdx.y * (blockDim.y * tileSize) + threadIdx.y * tileSize;

    // Use shared memory for weightArr
    __shared__ float sharedWeightArr[5][5];
    if (threadIdx.x < 5 && threadIdx.y < 5) {
        sharedWeightArr[threadIdx.x][threadIdx.y] = weightArr[threadIdx.x * 5 + threadIdx.y];
    }
    __syncthreads();

    for (int ii = 0; ii < tileSize; ++ii) {
        for (int jj = 0; jj < tileSize; ++jj) {
            int row = row_init + ii;
            int col = col_init + jj;

            // If coordinates are between boundaries
            if (row < n && col < n) {
                float influence = 0.0f;
                for (int i = -2; i < 3; i++) {
                    for (int j = -2; j < 3; j++) {
                        int y = (row + i + n) % n;
                        int x = (col + j + n) % n;
                        influence += sharedWeightArr[i + 2][j + 2] * readArr[y * n + x];
                    }
                }

                writeArr[row * n + col] = readArr[row * n + col];
                if (influence < -diff) writeArr[row * n + col] = -1;
                else if (influence > diff) writeArr[row * n + col] = 1;
            }
        }
    }
}