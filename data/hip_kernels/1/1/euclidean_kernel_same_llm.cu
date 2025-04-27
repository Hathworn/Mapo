```c
#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void euclidean_kernel_same(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x, y = blockIdx.y;

    // Initialize distance for diagonal elements
    if ((x == y) && (x < n_a) && (threadIdx.x == 0))
        d[y * pitch_d + x] = 0.0;

    // Compute element distances only for x < y
    if (y < n_a && x < y) {
        __shared__ float temp[NUM_THREADS];

        float sum = 0.0;
        // Calculate partial Euclidean distance for each thread
        for (size_t offset = threadIdx.x; offset < k; offset += NUM_THREADS) {
            float t = vg_a[x * pitch_a + offset] - vg_a[y * pitch_a + offset];
            sum += (t * t);
        }
        temp[threadIdx.x] = sum;

        __syncthreads();

        // Perform reduction in shared memory
        for (size_t stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
            if (threadIdx.x < stride)
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            __syncthreads();
        }

        // Write the result to global memory
        if (threadIdx.x == 0) {
            float s = sqrt(temp[0]);
            d[y * pitch_d + x] = s;
            d[x * pitch_d + y] = s;
        }
    }
}