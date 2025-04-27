#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_backward_depthwise_conv_weight_kernel(int nthreads, float *dst_grad, float *src_data, int batch_size, const int channels, int dst_h, int dst_w, const int src_h, const int src_w, int kernel_sz, int stride, int pad, float *weight_diff) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= nthreads) return;  // Early exit for out-of-bound threads

    int n = i / (channels * src_h * src_w);
    int c = (i / (src_h * src_w)) % channels;
    int h = (i / src_w) % src_h;
    int w = i % src_w;
    
    float *p_weight_diff = weight_diff + c * kernel_sz * kernel_sz;

    for (int kh = 0; kh < kernel_sz; ++kh) {
        for (int kw = 0; kw < kernel_sz; ++kw) {
            int h_out_s = h + pad - kh;
            int w_out_s = w + pad - kw;
            
            // Ensure h_out_s and w_out_s are divisible by stride
            if ((h_out_s % stride) == 0 && (w_out_s % stride) == 0) {
                int h_out = h_out_s / stride;
                int w_out = w_out_s / stride;
                
                // Check bounds
                if (h_out >= 0 && h_out < dst_h && w_out >= 0 && w_out < dst_w) {
                    int offset = ((n * channels + c) * dst_h + h_out) * dst_w + w_out;
                    // Accumulate weight gradient
                    atomicAdd(p_weight_diff, src_data[i] * dst_grad[offset]);
                }
            }
            ++p_weight_diff;
        }
    }
}