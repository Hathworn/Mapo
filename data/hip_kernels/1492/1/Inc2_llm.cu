#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc2(float *Ad, float *Bd) {
    // Use shared memory for improved memory access times
    __shared__ float sharedA[LEN]; 

    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if(tx < 1024) {
        // Load data into shared memory
        sharedA[threadIdx.x] = Ad[tx];

        for(int i = 0; i < ITER; i++) {
            sharedA[threadIdx.x] += 1.0f;

            // Use a non-divergent loop for copying
            #pragma unroll // Unroll the loop for better performance
            for(int j = 0; j < 256; j++) {
                Bd[tx] = sharedA[threadIdx.x];
            }
        }

        // Write back to global memory
        Ad[tx] = sharedA[threadIdx.x];
    }
}