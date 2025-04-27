#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D index calculation
    if (i >= N) return;
  
    // Calculate 3D index dimensions
    int out_w = (i % (w * stride));
    int out_h = ((i / (w * stride)) % (h * stride));
    int out_c = ((i / (w * stride * h * stride)) % c);
    int b = ((i / (w * stride * h * stride * c)) % batch);

    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_c = out_c;
    
    // Calculate 1D input index
    int in_index = b * w * h * c + in_c * w * h + in_h * w + in_w;

    // Apply forward or backward operation
    if (forward) {
        atomicAdd(&out[out_index], scale * x[in_index]); // Optimized for atomic add in forward
    } else {
        atomicAdd(x + in_index, scale * out[out_index]); // Still necessary to use atomicAdd due to possible concurrency issues
    }
}