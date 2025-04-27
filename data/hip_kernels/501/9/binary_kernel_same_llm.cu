#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void binary_kernel_same(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // Initialize diagonal elements
    if(x == y && x < n_a && threadIdx.x == 0) {
        d[y * pitch_d + x] = 0.0;
    }

    // Calculate elements only if y < n_a and x < y
    if(y < n_a && x < y) {
        __shared__ float temp[2 * NUM_THREADS];

        float local_diff = 0.0;
        float local_union = 0.0;

        // Use loop unrolling for efficiency
        for(size_t offset = threadIdx.x; offset < k; offset += blockDim.x * 2) {
            int a = vg_a[x * pitch_a + offset] != 0.0;
            int b = vg_a[y * pitch_a + offset] != 0.0;
            if(a ^ b) local_diff += 1.0;
            if(a || b) local_union += 1.0;

            if(offset + blockDim.x < k) {
                int a_next = vg_a[x * pitch_a + offset + blockDim.x] != 0.0;
                int b_next = vg_a[y * pitch_a + offset + blockDim.x] != 0.0;
                if(a_next ^ b_next) local_diff += 1.0;
                if(a_next || b_next) local_union += 1.0;
            }
        }
        
        temp[threadIdx.x] = local_diff;
        temp[threadIdx.x + NUM_THREADS] = local_union;

        __syncthreads();

        // Loop unrolling for reduction
        for(size_t stride = blockDim.x / 2; stride > 0; stride >>= 1) {
            if(threadIdx.x < stride) {
                temp[threadIdx.x] += temp[threadIdx.x + stride];
                temp[threadIdx.x + NUM_THREADS] += temp[threadIdx.x + stride + NUM_THREADS];
            }
            __syncthreads();
        }

        if(threadIdx.x == 0) {
            float val = temp[0];
            if(temp[NUM_THREADS] != 0.0) {
                val /= temp[NUM_THREADS];
            }
            d[y * pitch_d + x] = val;
            d[x * pitch_d + y] = val;
        }
    }
}