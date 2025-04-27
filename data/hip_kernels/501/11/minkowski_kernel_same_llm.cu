#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void minkowski_kernel_same(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;
    
    // Initialize shared memory for parallel reduction
    __shared__ float temp[NUM_THREADS];
    
    if(x == y && x < n_a && threadIdx.x == 0) {
        d[y * pitch_d + x] = 0.0;
    }

    if(y < n_a && x < y) {
        float sum = 0.0;
        
        // Each thread accumulates part of the sum
        for(size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float t = fabsf(vg_a[x * pitch_a + offset] - vg_a[y * pitch_a + offset]);
            sum += __powf(t, p);
        }
        
        temp[threadIdx.x] = sum; // Store partial sums in shared memory
        
        __syncthreads(); // Ensure all threads have written their partial sums
        
        // Parallel reduction to sum partial results
        for(size_t stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
            if(threadIdx.x < stride) {
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            }
            __syncthreads(); // Ensure all threads are synchronized
        }
        
        // Write the result to global memory
        if(threadIdx.x == 0) {
            float power = 1.f / p;
            float s = __powf(temp[0], power);
            d[y * pitch_d + x] = s;
            d[x * pitch_d + y] = s;
        }
    }
}