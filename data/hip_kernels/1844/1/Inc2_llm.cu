#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc2(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if (tx < 1024) {
        // Use register to store value and reduce global memory access
        float a = Ad[tx];
        for (int i = 0; i < ITER; i++) {
            a += 1.0f; // Accumulate in register
            // Only update Bd after inner loop to reduce memory write
            for (int j = 0; j < 256; j++) {
                Bd[tx] = a;
            }
        }
        Ad[tx] = a; // Write back final result to Ad
    }
}