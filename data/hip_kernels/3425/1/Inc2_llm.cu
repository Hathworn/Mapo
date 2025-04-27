#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc2(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if (tx < LEN) {
        float temp = Ad[tx];  // Load value once
        for (int i = 0; i < ITER; i++) {
            temp += 1.0f;  // Accumulate result in register
            Ad[tx] = temp; // Write back to global memory
            Bd[tx] = temp; // Remove inner loop
        }
    }
}