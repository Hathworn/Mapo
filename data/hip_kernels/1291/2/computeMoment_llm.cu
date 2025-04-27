#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeMoment(int *readArr, int *writeArr, double *weightArr, int n) {
    __shared__ int readArr_shared[32][32];
    __shared__ double weightArr_shared[5][5];

    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Load weightArr to shared memory with thread coalescing
    if (threadIdx.x < 5 && threadIdx.y < 5) {
        weightArr_shared[threadIdx.x][threadIdx.y] = weightArr[threadIdx.x * 5 + threadIdx.y];
    }
    __syncthreads();

    // Load readArr into shared memory
    if (row < n && col < n) {
        readArr_shared[threadIdx.x][threadIdx.y] = readArr[row * n + col];
    }
    __syncthreads();

    if (row < n && col < n) {
        float influence = 0.0f;
        // Optimize boundaries check by combining conditions
        if (threadIdx.x >= MIN_MARGIN && threadIdx.y >= MIN_MARGIN &&
            threadIdx.x <= 31 - MIN_MARGIN && threadIdx.y <= 31 - MIN_MARGIN) {
            for (int i = -2; i < 3; i++) {
                for (int j = -2; j < 3; j++) {
                    influence += weightArr_shared[i + 2][j + 2] * readArr_shared[threadIdx.x + i][threadIdx.y + j];
                }
            }
            writeArr[row * n + col] = readArr_shared[threadIdx.x][threadIdx.y];
        } else {
            for (int i = -2; i < 3; i++) {
                for (int j = -2; j < 3; j++) {
                    int y = (row + i + n) % n;
                    int x = (col + j + n) % n;
                    influence += weightArr_shared[i + 2][j + 2] * readArr[y * n + x];
                }
            }
            writeArr[row * n + col] = readArr[row * n + col];
        }

        // Simplified influence assignment
        if (influence < -diff) {
            writeArr[row * n + col] = -1;
        } else if (influence > diff) {
            writeArr[row * n + col] = 1;
        }
    }
    __syncthreads();
}