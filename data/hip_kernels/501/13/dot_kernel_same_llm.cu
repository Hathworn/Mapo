#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void dot_kernel_same(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // If all element is to be computed
    if(y < n_a && x <= y) {
        __shared__ float temp[NUM_THREADS];

        float sum = 0.0f; // Initialize local accumulator
        for(size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            sum += vg_a[x * pitch_a + offset] * vg_a[y * pitch_a + offset];
        }
        temp[threadIdx.x] = sum; // Store local accumulator to shared memory

        // Sync with other threads
        __syncthreads();

        // Reduce
        for(size_t stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
            if(threadIdx.x < stride) {
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            }
            __syncthreads();
        }

        // Write to global memory
        if(threadIdx.x == 0) {
            float result = temp[0];
            d[y * pitch_d + x] = result;
            d[x * pitch_d + y] = result;
        }
    }
}