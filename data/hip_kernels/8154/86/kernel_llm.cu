#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *a, size_t N)
{
    int tid = threadIdx.x;
    __shared__ float s[BS];
    float sum = 0.0f;
    
    for (int ib = blockIdx.x; ib < (N + BS - 1) / BS; ib += gridDim.x) { // Use grid-stride loop
        int off = ib * BS + tid;
        
        if (off < N) { // Check bounds before accessing
            s[tid] = a[off];
        } else {
            s[tid] = 0.0f; // Avoid use of invalid memory
        }
        
        __syncthreads(); // Ensure all loads to shared memory complete
        
        // Reduce in shared memory
        for (int skip = BS / 2; skip > 0; skip >>= 1) {
            if (tid < skip) {
                s[tid] += s[tid + skip];
            }
            __syncthreads(); // Sync after each reduction step
        }
        
        sum += s[0]; // Only thread 0 has the reduced sum
    }
    
    if (tid == 0) { // Only thread 0 writes to the output
        atomicAdd(&a[0], sum);
    }
}