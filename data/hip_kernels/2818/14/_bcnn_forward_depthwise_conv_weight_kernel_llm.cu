#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_forward_depthwise_conv_weight_kernel(int nthreads, float *src_data, float *weight_data, int channels, int dst_h, int dst_w, int src_h, int src_w, int kernel_sz, int stride, int pad, float *dst_data) {
    // Get the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= nthreads) return; // Boundary check

    int n = i / (channels * dst_h * dst_w);
    int c = (i / (dst_h * dst_w)) % channels;
    int h = (i / dst_w) % dst_h;
    int w = i % dst_w;
    float *weight = weight_data + c * kernel_sz * kernel_sz;
    float value = 0.0f;
    
    // Loop over kernel size
    for (int kh = 0; kh < kernel_sz; ++kh) {
        int h_in = -pad + h * stride + kh;
        if (h_in >= 0 && h_in < src_h) { // Check vertical bounds
            for (int kw = 0; kw < kernel_sz; ++kw) {
                int w_in = -pad + w * stride + kw;
                if (w_in >= 0 && w_in < src_w) { // Check horizontal bounds
                    int offset = ((n * channels + c) * src_h + h_in) * src_w + w_in;
                    value += weight[kh * kernel_sz + kw] * src_data[offset];
                }
            }
        }
    }

    dst_data[i] = value;
}