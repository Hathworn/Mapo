#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul(int* A, int* B, int* C) {
    // Calculate row and column indices using block and thread indices.
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Combine the two conditions into a single if statement to check valid thread processing.
    if (col < N && row < N) {
        int result = 0;
        // Unroll the loop for better performance when possible.
        // Use registers for temporary variable 'result' to reduce memory access overhead.
        #pragma unroll
        for (int i = 0; i < N; ++i) {
            result += A[row * N + i] * B[i * N + col];
        }
        // Set result in output matrix C.
        C[row * N + col] = result;
    }
}