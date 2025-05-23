#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void minkowski_kernel(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x, y = blockIdx.y;

    // If all element is to be computed
    if(x < n_a && y < n_b) {
        __shared__ float temp[NUM_THREADS];

        temp[threadIdx.x] = 0.0;
        
        // Loop through k with stride of blockDim.x
        for(size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float t = fabsf(vg_a[x * pitch_a + offset] - vg_b[y * pitch_b + offset]);
            temp[threadIdx.x] += __powf(t, p);
        }

        // Sync with other threads
        __syncthreads();

        // Reduce using warp reduction for efficiency
        for(size_t stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
            if(threadIdx.x < stride) 
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            __syncthreads();
        }

        // Write to global memory
        if(threadIdx.x == 0) {
            float power = 1.f / p;
            d[y * pitch_d + x] = __powf(temp[0], power);
        }
    }
}