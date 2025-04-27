#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernMoveMem(const size_t numPoints, const size_t pointDim, const size_t s, double* A) {
    int b = blockIdx.y * gridDim.x + blockIdx.x;
    int i = b * blockDim.x + threadIdx.x;

    // Improved use of shared memory with better coalesced access
    __shared__ double mem[1024];

    size_t idx = s * i * pointDim;
    if (idx < numPoints * pointDim) {
        // Load data into shared memory, assuming total threads fit within shared memory size
        mem[threadIdx.x] = A[idx];
    }
    __syncthreads();

    idx = i * pointDim;
    if (idx < numPoints * pointDim) {
        A[idx] = mem[threadIdx.x];
    }
}