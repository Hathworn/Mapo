#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_horizontal_naive_output(const int n, float *y, const float *x, const float *w, const int iH, const int iW, const int kL)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for tile-based optimization
    __shared__ float shared_w[256];  // Assuming kL <= 256

    // Precompute values that are constant in this iteration
    int oW = iW - kL + 1;
    
    // Iterate over data by stride
    while (i < n) {
        int x_offset = (i / oW) * iW + (i % oW);
        int w_offset = (i / (oW * iH)) * kL;

        // Load weights into shared memory
        if (threadIdx.x < kL) {
            shared_w[threadIdx.x] = w[w_offset + threadIdx.x];
        }
        
        // Ensure all threads have loaded weights
        __syncthreads();
        
        // Convolution calculation
        float result = 0.0f;
        for (int k = 0; k < kL; k++) {
            result += shared_w[k] * x[x_offset + k];
        }
        y[i] = result;
        
        // Move to next data point
        i += blockDim.x * gridDim.x;
    }
}