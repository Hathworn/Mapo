#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void canberra_kernel(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // If all element is to be computed
    if(x < n_a && y < n_b) {
        __shared__ float temp[NUM_THREADS];
        float local_sum = 0.0f;

        // Use registers for partial sum
        for(size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float num = fabsf(vg_a[x * pitch_a + offset] - vg_b[y * pitch_b + offset]);
            float den = fabsf(vg_a[x * pitch_a + offset] + vg_b[y * pitch_b + offset]);
            if(den != 0.0f) {
                local_sum += num / den;
            }
        }

        temp[threadIdx.x] = local_sum;
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
            d[y * pitch_d + x] = temp[0];
        }
    }
}