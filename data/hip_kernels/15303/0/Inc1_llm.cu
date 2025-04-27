#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc1(float *Ad, float *Bd) {
    // Use shared memory for performance improvement
    __shared__ float sharedA[1024];
    __shared__ float sharedB[1024];

    int tx = threadIdx.x + blockIdx.x * blockDim.x;

    if (tx < 1) {
        float ad_val = Ad[tx];

        for (int i = 0; i < ITER; i++) {
            ad_val += 1.0f;

            // Split the loop into smaller pieces to reduce control overhead
            #pragma unroll
            for (int j = 0; j < 256; j++) {
                sharedB[tx] = ad_val;
            }
        }

        Ad[tx] = ad_val;
        Bd[tx] = sharedB[tx];
    }
}