#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void maximum_kernel(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // Check bounds for valid element computation
    if(x < n_a && y < n_b) {
        __shared__ float temp[NUM_THREADS];

        // Initialize shared memory
        float local_max = 0.0f;
        for(size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float t = abs(vg_a[x * pitch_a + offset] - vg_b[y * pitch_b + offset]);
            local_max = max(local_max, t);
        }
        temp[threadIdx.x] = local_max;

        // Sync with other threads
        __syncthreads();

        // Reduce using shared memory
        for(size_t stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
            if(threadIdx.x < stride) {
                temp[threadIdx.x] = max(temp[threadIdx.x], temp[threadIdx.x + stride]);
            }
            __syncthreads();
        }

        // Write the result from the first thread to global memory
        if(threadIdx.x == 0) {
            d[y * pitch_d + x] = temp[0];
        }
    }
}