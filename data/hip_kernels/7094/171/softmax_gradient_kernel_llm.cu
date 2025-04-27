#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    
    // Reduce using warp shuffle for better performance  
    float tmp = 0;
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Use a single warp for the final reduction  
    if (idx < warpSize) {
        #pragma unroll
        for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
            if (idx < offset) {
                reduction_buffer[idx] += reduction_buffer[idx + offset];
            }
            __syncthreads();
        }
    }
    
    // Compute gradient after final reduction with the first thread managing the tmp  
    if (idx == 0) {
        tmp = reduction_buffer[0];
    }
    __syncthreads();
    
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}