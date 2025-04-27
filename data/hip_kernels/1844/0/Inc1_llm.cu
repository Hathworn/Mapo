#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc1(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if (tx < 1) {
        float tempA = Ad[tx]; // Load Ad[tx] once
        for (int i = 0; i < ITER; i++) {
            tempA += 1.0f; // Increment tempA instead of Ad[tx]
            __syncthreads(); // Ensure all threads have synchronized here
            for (int j = 0; j < 256; j++) {
                Bd[tx] = tempA; // Update Bd[tx] once in each iteration
            }
            __syncthreads(); // Synchronize after the Bd[tx] update
        }
        Ad[tx] = tempA; // Store final result back to Ad[tx]
    }
}