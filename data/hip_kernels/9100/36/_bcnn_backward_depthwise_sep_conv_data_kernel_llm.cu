#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_backward_depthwise_sep_conv_data_kernel(int nthreads, float *dst_grad, float *weight_data, int batch_size, const int channels, int dst_h, int dst_w, const int src_h, const int src_w, int kernel_sz, int stride, int pad, float *src_grad)
{
    // Compute thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over work items assigned to this thread
    for (; i < nthreads; i += blockDim.x * gridDim.x) {
        int n = i / channels / src_h / src_w;
        int c = (i / src_h / src_w) % channels;
        int h = (i / src_w) % src_h;
        int w = i % src_w;
        float *weight = weight_data + c * kernel_sz * kernel_sz;
        float value = 0.0f;

        // Optimize inner loops by reducing constant operations
        for (int kh = 0; kh < kernel_sz; ++kh) {
            int h_out_s = h + pad - kh;
            if (h_out_s % stride == 0) {
                int h_out = h_out_s / stride;
                if (h_out >= 0 && h_out < dst_h) {
                    for (int kw = 0; kw < kernel_sz; ++kw) {
                        int w_out_s = w + pad - kw;
                        if (w_out_s % stride == 0) {
                            int w_out = w_out_s / stride;
                            if (w_out >= 0 && w_out < dst_w) {
                                // Calculate offset and accumulate result
                                int offset = ((n * channels + c) * dst_h + h_out) * dst_w + w_out;
                                value += weight[kw] * dst_grad[offset];
                            }
                        }
                    }
                }
            }
        }
        src_grad[i] += value;
    }
}