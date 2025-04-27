#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void euclidean_kernel(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // If an element is to be computed
    if(x < n_a && y < n_b) {

        // Use dynamically allocated shared memory
        extern __shared__ float temp[];

        temp[threadIdx.x] = 0.0f;

        // Unrolling the loop for performance optimization
        size_t offset;
        for(offset = threadIdx.x; offset + 4 < k; offset += blockDim.x * 4) {
            float t0 = vg_a[x * pitch_a + offset] - vg_b[y * pitch_b + offset];
            float t1 = vg_a[x * pitch_a + offset + 1] - vg_b[y * pitch_b + offset + 1];
            float t2 = vg_a[x * pitch_a + offset + 2] - vg_b[y * pitch_b + offset + 2];
            float t3 = vg_a[x * pitch_a + offset + 3] - vg_b[y * pitch_b + offset + 3];
            temp[threadIdx.x] += t0 * t0 + t1 * t1 + t2 * t2 + t3 * t3;
        }

        // Process any remaining elements
        for(; offset < k; ++offset) {
            float t = vg_a[x * pitch_a + offset] - vg_b[y * pitch_b + offset];
            temp[threadIdx.x] += t * t;
        }
        
        // Sync with other threads
        __syncthreads();

        // Reduce using shared memory
        for(size_t stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
            if(threadIdx.x < stride) {
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            }
            __syncthreads();
        }

        // Write to global memory
        if(threadIdx.x == 0) {
            d[y * pitch_d + x] = sqrtf(temp[0]);
        }
    }
}