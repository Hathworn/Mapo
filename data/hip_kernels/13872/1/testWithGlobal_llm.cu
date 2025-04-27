#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float compute(int idx, float* buf, int s)
{
    // Some random calcs to make the kernel unempty
    float k = 0.0f;
    for (int x = 0; x < s; x++) {
        k += cosf(x * 0.1f * idx);
        buf[x] = k;
    }
    
    // Optimize: Combine loops to improve spatial locality
    float sum = 0.0f;
    for (int x = s - 1; x >= 0; x--) {
        buf[x] = buf[x] * buf[x];
        if (x > 0) {
            sum += buf[x - 1] / (fabsf(buf[x]) + 0.1f);
        }
    }
    
    return sum;
}

__global__ void testWithGlobal(int n, int s, float* result, float* buf) {
    // Calculate unique thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < n) {
        // Optimize: Use shared memory for buffer per block
        extern __shared__ float sharedBuf[];
        float* localBuf = &sharedBuf[threadIdx.x * s];
        
        result[idx] = compute(idx, localBuf, s);
    }
}