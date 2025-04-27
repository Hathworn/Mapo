#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_array_dot_product_r8__(size_t tsize, const double *arr1, const double *arr2, volatile double *dprod)
{
    extern __shared__ double dprs_r8[]; // Shared memory for partial sums
    size_t l = blockIdx.x * blockDim.x + threadIdx.x;
    double dpr = 0.0;

    // Unroll loop for better performance
    while (l < tsize) {
        dpr += arr1[l] * arr2[l];
        l += gridDim.x * blockDim.x;
    }

    dprs_r8[threadIdx.x] = dpr;
    __syncthreads();

    // Reduce using a more efficient method
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            dprs_r8[threadIdx.x] += dprs_r8[threadIdx.x + stride];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        // Acquire lock using atomic operation
        while (atomicCAS(&dot_product_wr_lock, 0, 1) != 0) { }
        
        *dprod += dprs_r8[0];
        __threadfence();

        // Release lock
        atomicExch(&dot_product_wr_lock, 0);
    }
}