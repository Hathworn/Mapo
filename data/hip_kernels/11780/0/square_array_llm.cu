#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Use shared memory for faster access
    extern __shared__ float shared_a[];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load data into shared memory
    if (idx < N) shared_a[threadIdx.x] = a[idx];
    __syncthreads();

    // Compute square in shared memory
    if (idx < N) shared_a[threadIdx.x] *= shared_a[threadIdx.x];
    __syncthreads();

    // Write results back to global memory
    if (idx < N) a[idx] = shared_a[threadIdx.x];
}