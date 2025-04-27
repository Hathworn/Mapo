#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_backward_upsample_cuda_kernel(size_t dst_sz, float *src, int w, int h, int c, int n, int size, float *dst) {
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    size_t stride = blockDim.x * gridDim.x;
    
    // Loop to handle more data if the kernel size is larger than the grid
    while (i < dst_sz) {
        int dst_idx = i;
        int dst_w = i % (w * size);
        i /= (w * size);
        int dst_h = i % (h * size);
        i /= (h * size);
        int dst_c = i % c;
        i /= c;
        int b = i % n;
        
        int in_w = dst_w / size;
        int in_h = dst_h / size;
        int src_idx = b * w * h * c + dst_c * w * h + in_h * w + in_w;
        
        atomicAdd(&src[src_idx], dst[dst_idx]); // Use atomicAdd for safe parallel accumulation
        
        i += stride; // Move to next index based on stride
    }
}