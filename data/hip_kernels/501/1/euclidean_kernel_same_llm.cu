#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void euclidean_kernel_same(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x, y = blockIdx.y;

    if((x == y) && (x < n_a) && (threadIdx.x == 0))
        d[y * pitch_d + x] = 0.0;

    // Only process threads that actually have work
    if(y < n_a && x < y) {
        __shared__ float temp[NUM_THREADS];
        temp[threadIdx.x] = 0.0;

        // Unroll loop for better performance
        for(size_t offset = threadIdx.x; offset < k; offset += NUM_THREADS) {
            float t = vg_a[x * pitch_a + offset] - vg_a[y * pitch_a + offset];
            temp[threadIdx.x] += (t * t);
        }

        // Sync with other threads
        __syncthreads();

        // Use warp reduction for better performance
        for(size_t stride = warpSize >> 1; stride > 0; stride >>= 1) {
            if(threadIdx.x < stride)
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            __syncthreads();
        }

        // Write to global memory
        if(threadIdx.x == 0) {
            float s = sqrt(temp[0]);
            d[y * pitch_d + x] = s;
            d[x * pitch_d + y] = s;
        }
    }
}