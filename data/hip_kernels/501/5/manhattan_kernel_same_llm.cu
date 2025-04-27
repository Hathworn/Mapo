#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void manhattan_kernel_same(
    const float *vg_a, size_t pitch_a, size_t n_a,
    const float *vg_b, size_t pitch_b, size_t n_b,
    size_t k, float *d, size_t pitch_d, float p) {

    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // Initialize distance to zero when x equals y
    if (x == y && x < n_a && threadIdx.x == 0) {
        d[y * pitch_d + x] = 0.0;
    }

    // Ensure within bounds before computation
    if (y < n_a && x < y) {
        __shared__ float temp[NUM_THREADS];
        float local_sum = 0.0;  // Local sum for each thread

        // Calculate partial distances
        for (size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float t = fabsf(vg_a[x * pitch_a + offset] - vg_a[y * pitch_a + offset]);
            local_sum += t;
        }
        temp[threadIdx.x] = local_sum;

        // Sync after initialization
        __syncthreads();

        // Reduction to accumulate results
        for (size_t stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
            if (threadIdx.x < stride) {
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            }
            __syncthreads();
        }

        // Store the results in global memory
        if (threadIdx.x == 0) {
            float s = temp[0];
            d[y * pitch_d + x] = s;
            d[x * pitch_d + y] = s;
        }
    }
}