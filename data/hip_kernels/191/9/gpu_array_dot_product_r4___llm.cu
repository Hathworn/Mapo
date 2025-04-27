#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_array_dot_product_r4__(size_t tsize, const float *arr1, const float *arr2, volatile float *dprod)
{
    extern __shared__ float dprs_r4[]; // shared memory for partial dot products

    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    size_t stride = gridDim.x * blockDim.x;

    // Initialize partial dot product for this thread
    float dpr = 0.0f;

    // Parallel accumulation of dot product
    for (size_t l = idx; l < tsize; l += stride) {
        dpr += arr1[l] * arr2[l];
    }

    // Store partial result in shared memory
    dprs_r4[threadIdx.x] = dpr;
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            dprs_r4[threadIdx.x] += dprs_r4[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Add block's contribution to final result
    if (threadIdx.x == 0) {
        int lock;
        do {
            lock = atomicMax(&dot_product_wr_lock, 1); // Try to acquire lock
        } while (lock == 1);

        *dprod += dprs_r4[0]; // Update global dot product
        __threadfence(); // Ensure the update is visible before releasing lock
        
        atomicExch(&dot_product_wr_lock, 0); // Release lock
    }
}