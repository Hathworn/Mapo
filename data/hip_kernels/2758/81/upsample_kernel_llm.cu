#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    // Calculate global index
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Ensure index is within bounds
    if (idx >= N) return;

    // Compute index components
    int out_index = idx;
    int out_w = (out_index % (w * stride));
    out_index /= (w * stride);
    int out_h = (out_index % (h * stride));
    out_index /= (h * stride);
    int out_c = (out_index % c);
    out_index /= c;
    int b = (out_index % batch);

    // Compute input indices
    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_c = out_c;
    int in_index = b * w * h * c + in_c * w * h + in_h * w + in_w;

    // Apply forward or backward operation
    if (forward) {
        // Improve memory access by using shared memory or constant memory if possible
        out[idx] += scale * __ldg(&x[in_index]); // Use texture cache if applicable
    } else {
        atomicAdd(&x[in_index], scale * out[idx]);
    }
}