#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matMultCuda(float *cu_C, float *cu_A, float *cu_B, unsigned int n) {
    // Calculate row and column index for current thread
    int row = (blockIdx.x * blockDim.x) + threadIdx.x;
    int col = (blockIdx.y * blockDim.y) + threadIdx.y;

    // Ensure thread is within matrix bounds
    if (row < n && col < n) {
        float temp_sum = 0.0f; // Use float instead of int for precise computation

        // Utilize shared memory for faster data access
        extern __shared__ float shared_A[], shared_B[];
        shared_A[threadIdx.y * n + threadIdx.x] = cu_A[row * n + threadIdx.x];
        shared_B[threadIdx.y * n + threadIdx.x] = cu_B[threadIdx.y * n + col];
        __syncthreads();

        for (int elem = 0; elem < n; elem++) {
            temp_sum += shared_A[threadIdx.y * n + elem] * shared_B[elem * n + col];
        }

        cu_C[row * n + col] = temp_sum; // Store result
    }
}