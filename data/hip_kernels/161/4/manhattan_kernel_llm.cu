#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void manhattan_kernel(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;
    
    // Check bounds once for all elements
    if(x < n_a && y < n_b) {
        __shared__ float temp[NUM_THREADS];
        
        temp[threadIdx.x] = 0.0;
        
        // Unroll the loop for better efficiency
        size_t offset = threadIdx.x;
        while(offset < k) {
            float t = fabs(vg_a[x * pitch_a + offset] - vg_b[y * pitch_b + offset]);
            temp[threadIdx.x] += t;
            offset += blockDim.x;
        }

        // Sync with other threads
        __syncthreads();

        // Use reduction for summing
        for(size_t stride = blockDim.x / 2; stride > 0; stride /= 2) {
            if(threadIdx.x < stride) {
                temp[threadIdx.x] += temp[threadIdx.x + stride];
            }
            __syncthreads();
        }

        // Only first thread writes back result
        if(threadIdx.x == 0) {
            d[y * pitch_d + x] = temp[0];
        }
    }
}