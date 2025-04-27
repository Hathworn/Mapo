#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecProductKernel(float *d_z, const float *d_x, const float *d_y, unsigned int N)
{
    // Utilize shared memory for faster access
    extern __shared__ float shared_memory[];
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + tid;

    if (idx < N) {
        // Load data into shared memory
        shared_memory[tid] = d_x[idx] * d_y[idx];
        __syncthreads();  // Ensure all loads are complete

        // Write the result back to global memory
        d_z[idx] = shared_memory[tid];
    }
}