#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void euclidean_kernel_same(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x, y = blockIdx.y;
    if ((x == y) && (x < n_a) && (threadIdx.x == 0))
        d[y * pitch_d + x] = 0.0;

    // Optimize by using fewer __syncthreads thanks to warp shuffle
    if (y < n_a && x < y) {
        float sum = 0.0;
        for (size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float t = vg_a[x * pitch_a + offset] - vg_a[y * pitch_a + offset];
            sum += (t * t);
        }

        // Reduce sum using warp reduction
        for (int stride = warpSize / 2; stride > 0; stride /= 2) {
            sum += __shfl_down_sync(0xFFFFFFFF, sum, stride);
        }

        // Use block-level reduction for final result
        __shared__ float warp_sums[32];
        if (threadIdx.x % warpSize == 0) {
            warp_sums[threadIdx.x / warpSize] = sum;
        }
        __syncthreads();

        if (threadIdx.x < blockDim.x / warpSize) {
            sum = warp_sums[threadIdx.x];
            for (int stride = (blockDim.x / warpSize) / 2; stride > 0; stride /= 2) {
                sum += __shfl_down_sync(0xFFFFFFFF, sum, stride);
            }
        }

        if (threadIdx.x == 0) {
            float s = sqrt(warp_sums[0]);
            d[y * pitch_d + x] = s;
            d[x * pitch_d + y] = s;
        }
    }
}