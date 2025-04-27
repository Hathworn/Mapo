#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc1(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if (tx < 1) {
        float A_temp = Ad[tx]; // Load Ad[tx] into register to reduce memory accesses
        for (int i = 0; i < ITER; i++) {
            A_temp += 1.0f; // Perform arithmetic in register
            __syncthreads(); // Ensure all threads are synchronized if needed
        }
        Ad[tx] = A_temp; // Write the final result back to global memory once
        __syncthreads(); // Ensure Ad[tx] is updated before copying to Bd
        for (int j = 0; j < 256; j++) {
            Bd[tx] = A_temp; // Assign updated A_temp to Bd[tx]
        }
    }
}