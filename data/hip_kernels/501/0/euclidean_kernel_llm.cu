#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void euclidean_kernel(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // If an element is to be computed
    if(x < n_a && y < n_b) {
        __shared__ float temp[NUM_THREADS];

        float sum = 0.0f; // Use a register for partial sum
        for(size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float t = vg_a[x * pitch_a + offset] - vg_b[y * pitch_b + offset];
            sum += (t * t);
        }
        temp[threadIdx.x] = sum;

        // Sync with other threads
        __syncthreads();

        // Unroll and optimize reduction
        for(size_t stride = blockDim.x / 2; stride > 0; stride /= 2) {
            if(threadIdx.x < stride) {
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            }
            __syncthreads();
        }

        // Write to global memory
        if(threadIdx.x == 0) {
            d[y * pitch_d + x] = sqrt(temp[0]);
        }
    }
}