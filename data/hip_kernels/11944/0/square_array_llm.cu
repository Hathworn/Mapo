#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory for faster access
    extern __shared__ float s_data[];
    // Load data into shared memory
    if (idx < N) s_data[threadIdx.x] = a[idx];
    __syncthreads();
    // Compute square in shared memory
    if (idx < N) s_data[threadIdx.x] *= s_data[threadIdx.x];
    __syncthreads();
    // Write result back to global memory
    if (idx < N) a[idx] = s_data[threadIdx.x];
}