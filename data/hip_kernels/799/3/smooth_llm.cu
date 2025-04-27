#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth(float * v_new, const float * v) {
    int myIdx = blockDim.x * blockIdx.x + threadIdx.x;  // Calculate global index
    int numThreads = gridDim.x * blockDim.x;

    // Use shared memory to reduce global memory access
    extern __shared__ float shared[];
    shared[threadIdx.x] = v[myIdx];

    __syncthreads();

    // Fetch neighbors using shared memory with boundary conditions
    float myElt = shared[threadIdx.x];
    float myLeftElt = (threadIdx.x == 0 && myIdx > 0) ? v[myIdx - 1] : ((threadIdx.x > 0) ? shared[threadIdx.x - 1] : myElt);
    float myRightElt = (threadIdx.x == blockDim.x - 1 && myIdx < numThreads - 1) ? v[myIdx + 1] : ((threadIdx.x < blockDim.x - 1) ? shared[threadIdx.x + 1] : myElt);

    // Calculating the new value
    v_new[myIdx] = 0.25f * myLeftElt + 0.5f * myElt + 0.25f * myRightElt;
}