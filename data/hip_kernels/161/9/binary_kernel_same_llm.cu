#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void binary_kernel_same(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    if (x == y && x < n_a && threadIdx.x == 0) {
        d[y * pitch_d + x] = 0.0;
    }

    if (y < n_a && x < y) {
        __shared__ float temp[2 * NUM_THREADS];
        
        // Initialize shared memory once
        if (threadIdx.x < 2 * NUM_THREADS) {
            temp[threadIdx.x] = 0.0;
        }
        __syncthreads();
        
        // Calculate temp values across threads
        for (size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            int a = vg_a[x * pitch_a + offset] != 0.0;
            int b = vg_a[y * pitch_a + offset] != 0.0;
            if (a ^ b) {
                atomicAdd(&temp[threadIdx.x], 1.0);
            }
            if (a || b) {
                atomicAdd(&temp[threadIdx.x + NUM_THREADS], 1.0);
            }
        }

        // Sync to ensure all threads have added their contributions
        __syncthreads();

        // Use first thread of the block to calculate the result
        if (threadIdx.x == 0) {
            float val = temp[0];
            if (temp[NUM_THREADS] != 0.0) {
                val /= temp[NUM_THREADS];
            }
            d[y * pitch_d + x] = val;
            d[x * pitch_d + y] = val;
        }
    }
}