#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Mul(float *newMatrix, float *mulMatrix, int Max, float *sumMatrix) {
    // Use shared memory to reduce global memory accesses
    __shared__ float sharedNewMatrix[32][32]; // Adjust size as needed
    __shared__ float sharedMulMatrix[32][32]; // Adjust size as needed

    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    float temp = 0.0f;
    for (int k = 0; k < Max; k++) {
        // Load elements into shared memory
        sharedNewMatrix[threadIdx.y][threadIdx.x] = newMatrix[row * Max + k];
        sharedMulMatrix[threadIdx.y][threadIdx.x] = newMatrix[k * Max + col];
        __syncthreads(); // Synchronize threads for shared memory use

        // Calculate product and accumulate into temp
        temp += sharedNewMatrix[threadIdx.y][threadIdx.x] * sharedMulMatrix[threadIdx.y][threadIdx.x];
        __syncthreads(); // Ensure all computations are complete before next iteration
    }

    // Write results to global memory
    atomicAdd(&mulMatrix[row * Max + col], temp);
}