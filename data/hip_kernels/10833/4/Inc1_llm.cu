#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void Inc1(float *Ad, float *Bd) {
    int tx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation
    if(tx < 1) {
        float temp = Ad[tx]; // Store Ad[tx] in a temporary variable to reduce global memory access
        for(int i = 0; i < ITER; i++) {
            temp = temp + 1.0f; // Increment temporary variable
            for(int j = 0; j < 256; j++) {
                Bd[tx] = temp; // Only need to set Bd[tx] once due to loop with the same value
            }
        }
        Ad[tx] = temp; // Write the final result back to global memory
    }
}