#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void euclidean_kernel_same(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x, y = blockIdx.y;

    if ((x == y) && (x < n_a) && (threadIdx.x == 0))
        d[y * pitch_d + x] = 0.0;

    // If all element computation is needed
    if (y < n_a && x < y) {
        __shared__ float temp[NUM_THREADS];

        // Initialize shared memory
        temp[threadIdx.x] = 0.0f;

        // Compute squared differences
        for (size_t offset = threadIdx.x; offset < k; offset += NUM_THREADS) {
            float t = vg_a[x * pitch_a + offset] - vg_a[y * pitch_a + offset];
            temp[threadIdx.x] += t * t;
        }

        // Synchronize threads
        __syncthreads();

        // Reduction within a block
        for (size_t stride = blockDim.x / 2; stride > 0; stride /= 2) {
            if (threadIdx.x < stride) {
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            }
            __syncthreads();
        }

        // Write the result to global memory
        if (threadIdx.x == 0) {
            float s = sqrtf(temp[0]);  // Use sqrtf for single precision
            d[y * pitch_d + x] = s;
            d[x * pitch_d + y] = s;
        }
    }
}