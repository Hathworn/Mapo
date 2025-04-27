#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel3(int* D, int* q, int b) {
    // Calculate indices outside of conditional for better readability
    int blockOffsetX = blockIdx.x * blockDim.x + threadIdx.x;
    int blockOffsetY = blockIdx.y * blockDim.y + threadIdx.y;

    // Use ternary operators for concise index calculation
    int i = blockIdx.x >= b ? blockOffsetX + blockDim.x : blockOffsetX;
    int j = blockIdx.y >= b ? blockOffsetY + blockDim.y : blockOffsetY;

    // Store N and THR_PER_BL in shared memory for faster access
    __shared__ int shared_N;
    __shared__ int shared_THR_PER_BL;
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        shared_N = N;
        shared_THR_PER_BL = THR_PER_BL;
    }
    __syncthreads();

    float d, f, e;
    // Loop condition simplified
    for (int k = b * shared_THR_PER_BL; k < (b + 1) * shared_THR_PER_BL; k++) {
        d = D[i * shared_N + j];
        f = D[i * shared_N + k];
        e = D[k * shared_N + j];

        __syncthreads(); // Ensure all threads have loaded their elements

        // Use simplified condition
        if (d > f + e) {
            D[i * shared_N + j] = f + e;
            q[i * shared_N + j] = k;
        }
    }
}