#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaising(int* G, double* w, int* newG, int n, int workperthread) {
    int startingId = threadIdx.x * workperthread;

    // Shared memory for w and G
    __shared__ double tempW[25];  // 5 * 5 = 25
    __shared__ int tempG[521 * 5];  // (517 + 4) * 5

    // Optimized copy necessary elements from G into tempG using threads
    for (int j = -2; j <= n + 2; j++) {
        if (threadIdx.x < 5) {
            for (int i = -2; i <= 2; i++) {
                tempG[(j + 2) + (i + 2) * (n + 4)] = G[((j + n) % n) + ((blockIdx.x + i + n) % n) * n];
            }
        }
    }

    // Copy w into tempW
    if (threadIdx.x < 25) {
        tempW[threadIdx.x] = w[threadIdx.x];
    }
    __syncthreads();

    // Compute new spins
    for (int element = 0; element < workperthread; element++) {
        double newSpin = 0.0;

        // Calculate new spin value
        for (int ii = 0; ii < 5; ii++) {
            for (int jj = 0; jj < 5; jj++) {
                newSpin += tempW[jj + ii * 5] * tempG[startingId + element + jj + ii * (n + 4)];
            }
        }

        // Global index of the element
        int index = startingId + element + blockIdx.x * blockDim.x * workperthread;

        // Update the newG based on newSpin value
        newG[index] = (newSpin > 0.000001) ? 1 : (newSpin < -0.000001) ? -1 : G[index];
    }
    __syncthreads();
}