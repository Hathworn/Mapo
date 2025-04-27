#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Laplace(float* d_out, float* d_in) {
    // Calculate rowID and colID more efficiently
    int colID = blockIdx.x * blockDim.x + threadIdx.x + 1;
    int rowID = blockIdx.y * blockDim.y + threadIdx.y + 1;
    int pos = rowID * (blockDim.x + 2) + colID;

    // Use shared memory to reduce global memory access
    extern __shared__ float shared_in[];
    int shared_pos = threadIdx.y * blockDim.x + threadIdx.x;
    shared_in[shared_pos] = d_in[pos];
    __syncthreads();

    // Improved memory access by using shared memory when possible
    if (threadIdx.x > 0 && threadIdx.x < blockDim.x - 1 && threadIdx.y > 0 && threadIdx.y < blockDim.y - 1) {
        d_out[pos] = (shared_in[shared_pos - 1] + shared_in[shared_pos + 1] +
                      shared_in[shared_pos - blockDim.x] + shared_in[shared_pos + blockDim.x]) / 4.0; 
    } else {
        d_out[pos] = (d_in[pos - 1] + d_in[pos + 1] +
                      d_in[pos - blockDim.x - 2] + d_in[pos + blockDim.x + 2]) / 4.0; // Handle boundary conditions
    }
}