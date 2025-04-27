#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_shared(float * v_new, const float * v) {
    extern __shared__ float s[];
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    int tid = threadIdx.x + 1;
    
    // Improve memory coalescing by reading from global memory to shared memory efficiently
    s[tid] = v[id];
    
    // Only the first thread in the block handles boundary values
    if (threadIdx.x == 0) {
        int start = blockDim.x * blockIdx.x;
        int end = blockDim.x * gridDim.x;
        s[0] = (start > 0) ? v[start - 1] : v[start];
        int right = start + blockDim.x;
        s[blockDim.x + 1] = (right < end) ? v[right] : v[right - 1];
    }
    
    __syncthreads();
    
    // Perform the smoothing operation using shared memory
    v_new[id] = 0.25f * s[tid - 1] + 0.5f * s[tid] + 0.25f * s[tid + 1];
}