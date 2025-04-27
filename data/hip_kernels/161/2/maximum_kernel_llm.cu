#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void maximum_kernel(const float *vg_a, size_t pitch_a, size_t n_a, const float *vg_b, size_t pitch_b, size_t n_b, size_t k, float *d, size_t pitch_d, float p) {
    size_t x = blockIdx.x * blockDim.x + threadIdx.x;
    size_t y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure the threads are within bounds
    if (x < n_a && y < n_b) {
        __shared__ float temp[NUM_THREADS * NUM_THREADS]; // Allocate sufficient shared memory
        float t_max = 0.0;

        // Avoid redundant threadIdx calculations
        temp[threadIdx.y * blockDim.x + threadIdx.x] = 0.0;

        for (size_t offset = threadIdx.y * blockDim.x + threadIdx.x; offset < k; offset += blockDim.x * blockDim.y) {
            float t = fabs(vg_a[x * pitch_a + offset] - vg_b[y * pitch_b + offset]);
            t_max = max(t_max, t);
        }

        temp[threadIdx.y * blockDim.x + threadIdx.x] = t_max;

        // Sync within block
        __syncthreads();

        // Perform reduction in shared memory
        for (size_t stride = blockDim.x * blockDim.y / 2; stride > 0; stride >>= 1) {
            if (threadIdx.y * blockDim.x + threadIdx.x < stride) {
                temp[threadIdx.y * blockDim.x + threadIdx.x] = max(temp[threadIdx.y * blockDim.x + threadIdx.x], temp[threadIdx.y * blockDim.x + threadIdx.x + stride]);
            }
            __syncthreads();
        }

        // Store result in global memory
        if (threadIdx.y * blockDim.x + threadIdx.x == 0) {
            d[y * pitch_d + x] = temp[0];
        }
    }
}