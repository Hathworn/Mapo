#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

// Optimized kernel function using warp shuffle reduction
__global__ void maximum_kernel(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // Check bounds
    if (x < n_a && y < n_b) {
        __shared__ float temp[NUM_THREADS];

        temp[threadIdx.x] = 0.0;
        for (size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            float t = abs(vg_a[x * pitch_a + offset] - vg_b[y * pitch_b + offset]);
            temp[threadIdx.x] = max(temp[threadIdx.x], t);
        }
        
        // Sync threads
        __syncthreads();
        
        // Using warp shuffle to reduce
        float max_val = temp[threadIdx.x];
        for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
            max_val = max(max_val, __shfl_down_sync(0xffffffff, max_val, stride));
        }

        // Write maximum value to global memory
        if (threadIdx.x == 0) {
            d[y * pitch_d + x] = max_val;
        }
    }
}