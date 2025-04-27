#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void conv_vertical_naive_output(const int n, float *y, const float *x, const float *w, const int iH, const int iW, const int kL)
{
    // Precompute constants outside of loop
    int oH = iH - kL + 1;
    int stride = blockDim.x * gridDim.x;
    
    // Use shared memory to reduce global memory accesses
    __shared__ float shared_w[1024]; // Size might need adjustment based on kL

    // Each thread calculates its work index
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += stride) {

        int x_offset = (i / (oH * iW)) * iH * iW + i % (oH * iW);
        int w_offset = (i / (oH * iW)) * kL;

        // Load weights into shared memory
        if (threadIdx.x < kL) {
            shared_w[threadIdx.x] = w[w_offset + threadIdx.x];
        }
        __syncthreads(); // Ensure all weights are loaded before proceeding

        float sum = 0.0f; // Temporary variable to accumulate results
        for (int k = 0; k < kL; k++) {
            sum += shared_w[k] * x[x_offset + k * iW];
        }
        y[i] = sum; // Store result back to global memory
    }
}