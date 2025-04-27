#include "hip/hip_runtime.h"
#include "includes.h"
#define TILE_SIZE 16

__global__ void matmul_v1(float* a, float* b, float* c, int n) {
    // C(nxn) = A(nxn) * B(nxn);

    __shared__ float A[TILE_SIZE][TILE_SIZE + 1];
    __shared__ float B[TILE_SIZE][TILE_SIZE + 1];

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int i = bx * TILE_SIZE + tx;
    int j = by * TILE_SIZE + ty;

    // Initialize shared memory in a single assignment
    A[ty][tx] = 0.0f;
    B[ty][tx] = 0.0f;
    if (i >= n || j >= n) return;

    float c_ij = 0.0f;
    // Use ceil for loop iteration count
    int num_tiles = ceilf(float(n) / TILE_SIZE);

    for (int m = 0; m < num_tiles; m++) {
        // Load A and B into shared memory using stride access to ensure coalescing
        if (m * TILE_SIZE + tx < n && j < n) {
            A[ty][tx] = a[j * n + m * TILE_SIZE + tx];
        }
        if (m * TILE_SIZE + ty < n && i < n) {
            B[ty][tx] = b[(m * TILE_SIZE + ty) * n + i];
        }

        __syncthreads();

        // Unroll loop for better performance
        #pragma unroll
        for (int k = 0; k < TILE_SIZE; k++) {
            c_ij += A[ty][k] * B[k][tx];
        }
        __syncthreads();
    }

    // Check bounds before writing the result to global memory
    if (i < n && j < n) {
        c[n * j + i] = c_ij;
    }
}