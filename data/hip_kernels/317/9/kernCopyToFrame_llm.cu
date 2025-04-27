#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernCopyToFrame(int N, uint8_t * frame, float * src) {
    // Calculate global thread index
    int idx = (blockIdx.x * blockDim.x) + threadIdx.x;
    
    // Use a single return statement
    if (idx < N) {
        frame[idx] = src[idx] < 0 ? 0 : (uint8_t) src[idx];
    }
}