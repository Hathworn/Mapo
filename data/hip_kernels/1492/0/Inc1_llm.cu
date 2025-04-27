#include "hip/hip_runtime.h"
#include "includes.h"

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc1(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Avoid out of bounds access and unnecessary checks
    if (tx >= LEN) return;
    
    // Unroll loop to increase parallelism and efficiency
    float aValue = Ad[tx];
    for (int i = 0; i < ITER; ++i) {
        aValue += 1.0f;
    }
    Ad[tx] = aValue;
    
    // Reduce loop frequency by storing value to Bd once after computation
    Bd[tx] = aValue;
}