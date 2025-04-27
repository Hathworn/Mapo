#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __findBoundaries(long long *keys, int *jc, int n, int njc, int shift) {
    __shared__ int dbuff[1024];
    int tid = threadIdx.x + blockDim.x * threadIdx.y;
    int imin = ((int)(32 * ((((long long)n) * blockIdx.x) / (gridDim.x * 32))));
    int imax = min(n, ((int)(32 * ((((long long)n) * (blockIdx.x + 1)) / (gridDim.x * 32) + 1))));

    // Initialize first index
    if (tid == 0 && blockIdx.x == 0) {
        jc[0] = 0;
    }
    
    __syncthreads(); // Make sure jc[0] is set before proceeding

    int lasti = 0x7fffffff;
    
    for (int i = imin; i <= imax; i += blockDim.x * blockDim.y) {
        int iv = njc;
        if (i + tid < imax) {
            iv = (int)(keys[i + tid] >> shift);
            dbuff[tid] = iv; // Load values into shared memory
        }
        
        __syncthreads(); // Synchronize to ensure all threads have written to shared memory

        if (i + tid < imax || i + tid == n) {
            if (tid > 0) lasti = dbuff[tid - 1]; // Use shared memory values
            if (iv > lasti) {
                for (int j = lasti + 1; j <= iv; j++) {
                    jc[j] = i + tid; // Update boundary
                }
            }
            if (tid == 0) {
                lasti = dbuff[blockDim.x * blockDim.y - 1]; // Update last value efficiently
            }
        }
        __syncthreads(); // Synchronize before next iteration
    }
}