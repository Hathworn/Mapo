#include "hip/hip_runtime.h"
#include "includes.h"
#define NUM_THREADS 32

__global__ void binary_kernel(const float * vg_a, size_t pitch_a, size_t n_a, const float * vg_b, size_t pitch_b, size_t n_b, size_t k, float * d, size_t pitch_d, float p)
{
    size_t x = blockIdx.x;
    size_t y = blockIdx.y;

    // Ensure element indices are within bounds
    if(x < n_a && y < n_b) {
        __shared__ float temp[2 * NUM_THREADS];

        // Initialize shared memory
        temp[threadIdx.x] = 0.0;
        temp[threadIdx.x + NUM_THREADS] = 0.0;

        // Loop with stride to handle more data points
        for(size_t offset = threadIdx.x; offset < k; offset += blockDim.x) {
            int a = vg_a[x * pitch_a + offset] != 0.0;
            int b = vg_b[y * pitch_b + offset] != 0.0;
            if(a ^ b) {
                temp[threadIdx.x] += 1.0;
            }
            if(a || b) {
                temp[threadIdx.x + NUM_THREADS] += 1.0;
            }
        }

        // Sync threads before reduction
        __syncthreads();

        // Reduce using a single loop and no shared memory conflicts
        for(size_t stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
            if(threadIdx.x < stride) {
                temp[threadIdx.x] += temp[threadIdx.x + stride];
                temp[threadIdx.x + NUM_THREADS] += temp[threadIdx.x + stride + NUM_THREADS];
            }
            __syncthreads();
        }

        // Write reduced value to global memory
        if(threadIdx.x == 0) {
            float val = temp[0];
            if(temp[NUM_THREADS] != 0.0) {
                val /= temp[NUM_THREADS];
            }
            d[y * pitch_d + x] = val;
        }
    }
}