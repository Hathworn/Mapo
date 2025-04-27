#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_vertical_naive_output(const int n, float *y, const float *x, const float *w, const int iH, const int iW, const int kL)
{
    // Use shared memory to cache input values and weights for faster access
    extern __shared__ float cache[]; 
    float* w_cache = cache; 
    float* x_cache = &cache[kL];

    int oH = iH - kL + 1;
    int global_idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = global_idx; i < n; i += stride) {
        // Compute offsets
        int x_offset = (i / (oH * iW)) * iH * iW + i % (oH * iW);
        int w_offset = (i / (oH * iW)) * kL;

        // Load weight into shared memory
        if (threadIdx.x < kL) {
            w_cache[threadIdx.x] = w[w_offset + threadIdx.x];
        }
        __syncthreads();

        // Accumulate product into result
        float result = 0.0f;
        for (int k = 0; k < kL; k++) {
            // Load input into shared memory
            if (threadIdx.x < iW) {
                x_cache[threadIdx.x] = x[x_offset + k * iW + threadIdx.x];
            }
            __syncthreads();

            result += w_cache[k] * x_cache[i % iW];
            __syncthreads();
        }

        y[i] = result;
    }
}