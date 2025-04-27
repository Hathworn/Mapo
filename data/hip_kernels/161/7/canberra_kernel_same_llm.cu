#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void canberra_kernel_same(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // Initialize diagonal elements to zero
    if (x == y && x < n_a && threadIdx.x == 0) {
        d[y * pitch_d + x] = 0.0;
    }

    // Compute for all elements where y < n_a and x < y
    if (y < n_a && x < y) {
        __shared__ float temp[NUM_THREADS];

        // Initialize shared memory
        temp[threadIdx.x] = 0.0;

        // Loop unrolling for better performance
        for (size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float num = abs(vg_a[x * pitch_a + offset] - vg_a[y * pitch_a + offset]);
            float den = abs(vg_a[x * pitch_a + offset] + vg_a[y * pitch_a + offset]);
            if (den != 0.0) {
                temp[threadIdx.x] += num / den;
            }
        }

        // Synchronize threads
        __syncthreads();

        // Reduce with optimization
        for (size_t stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
            if (threadIdx.x < stride) {
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            }
            __syncthreads();
        }

        // Store result in global memory
        if (threadIdx.x == 0) {
            float s = temp[0];
            // Write symmetric elements to avoid recomputation
            d[y * pitch_d + x] = s;
            d[x * pitch_d + y] = s;
        }
    }
}