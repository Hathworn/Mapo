#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void dot_kernel(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p) {
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // If all element is to be computed
    if (x < n_a && y < n_b) {
        __shared__ float temp[NUM_THREADS];

        temp[threadIdx.x] = 0.0;
        // Loop unrolling for better performance
        size_t offset = threadIdx.x;
        while (offset + 3 < k) {
            temp[threadIdx.x] += vg_a[x * pitch_a + offset] * vg_b[y * pitch_b + offset];
            temp[threadIdx.x] += vg_a[x * pitch_a + offset + 1] * vg_b[y * pitch_b + offset + 1];
            temp[threadIdx.x] += vg_a[x * pitch_a + offset + 2] * vg_b[y * pitch_b + offset + 2];
            temp[threadIdx.x] += vg_a[x * pitch_a + offset + 3] * vg_b[y * pitch_b + offset + 3];
            offset += blockDim.x << 2;
        }
        for (; offset < k; offset++) {
            temp[threadIdx.x] += vg_a[x * pitch_a + offset] * vg_b[y * pitch_b + offset];
        }

        __syncthreads();

        // Reduce using shuffle for better performance
        float sum = temp[threadIdx.x];
        for (size_t stride = NUM_THREADS / 2; stride > 0; stride >>= 1) {
            sum += __shfl_down_sync(0xFFFFFFFF, sum, stride);
        }

        // Write to global memory
        if (threadIdx.x == 0) {
            d[y * pitch_d + x] = sum;
        }
    }
}