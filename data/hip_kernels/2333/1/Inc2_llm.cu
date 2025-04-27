#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc2(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if (tx < 1024) {
        float a_value = Ad[tx]; // Cache the value of Ad[tx]
        for (int i = 0; i < ITER; i++) {
            a_value += 1.0f; // Increment cached value
            for (int j = 0; j < 256; j++) {
                Bd[tx] = a_value; // Use cached value for Bd[tx]
            }
        }
        Ad[tx] = a_value; // Write back the cached value to global memory
    }
}