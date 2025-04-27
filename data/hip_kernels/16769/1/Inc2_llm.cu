#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc2(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if (tx < 1024) {
        float A_val = Ad[tx]; // Load Ad[tx] to a register for faster access
        for (int i = 0; i < ITER; i++) {
            A_val += 1.0f; // Increment A_val instead of Ad[tx]
            float B_val = A_val; // Store in a temporary variable to minimize global memory accesses
            for (int j = 0; j < 256; j++) {
                Bd[tx] = B_val; // Write once to global memory
            }
        }
        Ad[tx] = A_val; // Write the updated value back to Ad[tx]
    }
}