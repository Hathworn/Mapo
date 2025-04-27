#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    // Efficient computation of the global index
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;
    
    // Use extended Euclidean method to determine indices, minimizing divisions
    size_t id = i;
    int out_w = id % (w * stride);
    id /= (w * stride);
    int out_h = id % (h * stride);
    id /= (h * stride);
    int out_c = id % c;
    int b = id / c;
    
    int in_w = out_w / stride;
    int in_h = out_h / stride;
    
    int in_index = b * w * h * c + out_c * w * h + in_h * w + in_w;
    
    // Conditional logic remains unchanged, but computation ordered for better readability and alignment
    if (forward) {
        out[i] += scale * x[in_index];
    } else {
        atomicAdd(x + in_index, scale * out[i]);
    }
}