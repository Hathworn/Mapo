#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc1(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    // Use shared memory for faster access
    __shared__ float cache;
    if(tx < 1) {
        cache = Ad[tx];
        for(int i = 0; i < ITER; i++) {
            // Increment once and store in shared cache
            cache = cache + 1.0f;
            // Remove the redundant loop
            Bd[tx] = cache;
        }
        // Write back to global memory once
        Ad[tx] = cache;
    }
}