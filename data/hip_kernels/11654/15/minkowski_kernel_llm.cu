#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void minkowski_kernel(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x, y = blockIdx.y;

    // Check if the current thread should perform computations
    if (x < n_a && y < n_b) {
        extern __shared__ float temp[];

        // Initialize shared memory
        temp[threadIdx.x] = 0.0;
        
        // Compute partial sum of powers
        for (size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float t = fabsf(vg_a[x * pitch_a + offset] - vg_b[y * pitch_b + offset]);
            temp[threadIdx.x] += __powf(t, p);
        }

        // Sync with other threads
        __syncthreads();

        // Improved reduction using warp, avoiding unnecessary sync
        for (size_t stride = warpSize; stride >= 1; stride /= 2) {
            if (threadIdx.x < stride) {
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            }
            __syncwarp();
        }

        // Write to global memory
        if (threadIdx.x == 0) {
            float power = 1.f / p;
            d[y * pitch_d + x] = __powf(temp[0], power);
        }
    }
}