#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc2(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure tx is within bounds
    if(tx < LEN){
        // Cache Ad[tx] to reduce global memory access
        float aVal = Ad[tx];
        for(int i = 0; i < ITER; i++) {
            aVal += 1.0f; // Increment cached value
            // Use shared variable to avoid redundant writes
            float bVal = aVal;
            for(int j = 0; j < 256; j++) {
                Bd[tx] = bVal;
            }
        }
        // Write back to global memory after loop
        Ad[tx] = aVal;
    }
}