#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc2(float *Ad, float *Bd) {
    // Calculate the thread's absolute index
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure threads do not access out-of-bound memory
    if (tx < LEN) {
        // Use a register to cache the value of Ad[tx] during iteration
        float a_val = Ad[tx];
        for (int i = 0; i < ITER; i++) {
            // Increment the cached value
            a_val += 1.0f;
            // Update Bd[tx] directly in the inner loop
            Bd[tx] = a_val;
        }
        // Write back the updated value to Ad after iteration
        Ad[tx] = a_val;
    }
}