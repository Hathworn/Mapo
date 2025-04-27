#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void post_scan(float* in, float* add, int len) {
    unsigned int t = threadIdx.x;
    unsigned int start = 2 * blockIdx.x * BLOCK_SIZE;

    // Load previous block sum only once
    float blockAdd = (blockIdx.x) ? add[blockIdx.x - 1] : 0;

    // Check boundaries and apply addition
    if (start + t < len) {
        in[start + t] += blockAdd;
    }
    if (start + BLOCK_SIZE + t < len) {
        in[start + BLOCK_SIZE + t] += blockAdd;
    }
}