#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void maximum_kernel_same(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x, y = blockIdx.y;

    if (x == y && x < n_a && threadIdx.x == 0) {
        d[y * pitch_d + x] = 0.0;
    }

    if (y < n_a && x < y) {
        __shared__ float temp[NUM_THREADS];
        float max_val = 0.0; // Local variable for max value

        for (size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float t = abs(vg_a[x * pitch_a + offset] - vg_a[y * pitch_a + offset]);
            max_val = max(t, max_val); // Use local variable
        }

        temp[threadIdx.x] = max_val;
        __syncthreads();

        for (size_t stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
            if (threadIdx.x < stride) {
                temp[threadIdx.x] = max(temp[threadIdx.x], temp[threadIdx.x + stride]);
            }
            __syncthreads();
        }

        if (threadIdx.x == 0) {
            float s = temp[0];
            d[y * pitch_d + x] = s;
            d[x * pitch_d + y] = s;
        }
    }
}