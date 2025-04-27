#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_forward_depthwise_sep_conv_weight_kernel(int nthreads, float *src_data, float *weight_data, int channels, int dst_h, int dst_w, int src_h, int src_w, int kernel_sz, int stride, int pad, float *dst_data)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride_total = blockDim.x * gridDim.x;

    while (i < nthreads) {
        int n = i / channels / dst_h / dst_w;
        int c = (i / dst_h / dst_w) % channels;
        int h = (i / dst_w) % dst_h;
        int w = i % dst_w;
        
        float value = 0.0f;
        float *weight = weight_data + c * kernel_sz * kernel_sz;

        // Simplifying the loop by pre-computing input coordinates
        int h_start = -pad + h * stride;
        int w_start = -pad + w * stride;

        for (int kh = 0; kh < kernel_sz; ++kh) {
            int h_in = h_start + kh;
            if (h_in >= 0 && h_in < src_h) { // Check row validity
                for (int kw = 0; kw < kernel_sz; ++kw) {
                    int w_in = w_start + kw;
                    if (w_in >= 0 && w_in < src_w) { // Check column validity
                        int offset = ((n * channels + c) * src_h + h_in) * src_w + w_in;
                        value += weight[kw] * src_data[offset];
                    }
                }
            }
            weight += kernel_sz; // Move to the next row in weight data
        }
        dst_data[i] = value;
        i += stride_total; // Move to the next index managed by the thread
    }
}