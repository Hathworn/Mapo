#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void canberra_kernel(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // If all elements need to be computed
    if(x < n_a && y < n_b) {
        extern __shared__ float temp[];

        temp[threadIdx.x] = 0.0f; // Use 0.0f for float
        float sum = 0.0f; // Optimized local accumulation

        for(size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float a_val = vg_a[x * pitch_a + offset];
            float b_val = vg_b[y * pitch_b + offset];
            float num = fabsf(a_val - b_val);
            float den = fabsf(a_val + b_val);
            if(den != 0.0f) {
                sum += num / den; // Accumulate locally
            }
        }

        temp[threadIdx.x] = sum; // Store local sum
        __syncthreads();

        // Use warp-level primitives for reduction
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