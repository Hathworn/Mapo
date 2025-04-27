#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void binary_kernel_same(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    if (x == y && x < n_a && threadIdx.x == 0) {
        d[y * pitch_d + x] = 0.0;
    }

    if (y < n_a && x < y) {
        // Use a single shared memory array to reduce memory usage
        __shared__ float temp[NUM_THREADS * 2];
        size_t tid = threadIdx.x;
        
        temp[tid] = 0.0f;
        temp[tid + NUM_THREADS] = 0.0f;

        // Unroll loop to improve performance
        for (size_t offset = tid; offset < k; offset += blockDim.x) {
            int a = vg_a[x * pitch_a + offset] != 0.0;
            int b = vg_a[y * pitch_a + offset] != 0.0;
            if (a ^ b) {
                temp[tid] += 1.0f;
            }
            if (a || b) {
                temp[tid + NUM_THREADS] += 1.0f;
            }
        }

        __syncthreads();

        // Optimize reduction with a single loop
        for (size_t stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
            if (tid < stride) {
                temp[tid] += temp[tid + stride];
                temp[tid + NUM_THREADS] += temp[tid + stride + NUM_THREADS];
            }
            __syncthreads();
        }

        // Write results to global memory
        if (tid == 0) {
            float val = temp[0];
            if (temp[NUM_THREADS] != 0.0f) {
                val /= temp[NUM_THREADS];
            }
            d[y * pitch_d + x] = val;
            d[x * pitch_d + y] = val;
        }
    }
}