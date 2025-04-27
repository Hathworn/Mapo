#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    int myIdx = blockIdx.x * blockDim.x + threadIdx.x; // Correct thread index calculation
    int numThreads = blockDim.x * gridDim.x;
    
    // Using shared memory for performance improvement
    extern __shared__ float s[];
    s[threadIdx.x] = v[myIdx];

    if (threadIdx.x > 0 && threadIdx.x < blockDim.x - 1) {
        s[threadIdx.x - 1] = v[myIdx - 1];
        s[threadIdx.x + 1] = v[myIdx + 1];
    }

    __syncthreads(); // Synchronize threads to ensure shared memory is fully populated

    float myLeftElt = (myIdx > 0) ? s[threadIdx.x - 1] : v[myIdx]; // Avoid out-of-bounds
    float myRightElt = (myIdx < numThreads - 1) ? s[threadIdx.x + 1] : v[myIdx]; // Avoid out-of-bounds
    
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * s[threadIdx.x] + 0.25f * myRightElt;
}