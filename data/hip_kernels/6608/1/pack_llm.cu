#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void pack(const int* prefix_sum, const int* src, int* dst, const int nb_vert) 
{
    // Use shared memory for faster access if possible
    __shared__ int shared_src[1024];
    __shared__ int shared_prefix_sum[1024];

    const int p = blockIdx.x * blockDim.x + threadIdx.x;

    if (p < nb_vert) {
        // Load data into shared memory
        shared_src[threadIdx.x] = src[p];
        shared_prefix_sum[threadIdx.x] = prefix_sum[p];
    }
    __syncthreads(); // Synchronize to ensure data is loaded in shared memory

    if (p < nb_vert) {
        const int elt = shared_src[threadIdx.x];
        if (elt >= 0) {
            dst[shared_prefix_sum[threadIdx.x]] = elt;
        }
    }
}