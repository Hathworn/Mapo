#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void convdw_gpu_kernel(float *dw, float *dy, float *x, const int S, const int outSize, const int inSize) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to optimize access patterns, reducing global memory transactions
    extern __shared__ float sharedMemory[];
    float *sharedX = sharedMemory;
    float *sharedDy = &sharedMemory[S * blockDim.y];

    if (row < inSize && col < outSize) {
        float dwValue = 0.0f; // Accumulate partial results in register

        for (int i = 0; i < S; ++i) {
            if (threadIdx.y < blockDim.y) {
                sharedX[threadIdx.y + i * blockDim.y] = x[row + S * i];
                sharedDy[threadIdx.x + i * blockDim.x] = dy[i * outSize + col];
            }
            __syncthreads(); // Ensure shared memory is populated for all threads

            // Compute with values from shared memory
            dwValue += sharedX[threadIdx.y + i * blockDim.y] * sharedDy[threadIdx.x + i * blockDim.x];
            __syncthreads(); // Ensure completion before next iteration
        }

        dw[row * outSize + col] += dwValue; // Update result in global memory
    }
}