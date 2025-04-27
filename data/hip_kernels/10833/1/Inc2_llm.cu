#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc2(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    // Use shared memory to minimize global memory access latency
    __shared__ float sharedA[256];
    
    if (tx < 1024) {
        // Load from global to shared memory
        float valueA = Ad[tx];
        for (int i = 0; i < ITER; i++) {
            // Perform computation using register
            valueA += 1.0f;
            // Reduce redundant computation by updating B only once per loop
            sharedA[threadIdx.x] = valueA;
        }
        Bd[tx] = sharedA[threadIdx.x];
        // Update global memory with the final value
        Ad[tx] = valueA;
    }
}