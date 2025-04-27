#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv2genericrev(float *input, float *kernel, float *output, int input_n, int input_h, int input_w, int kernel_n, int kernel_h, int kernel_w, float alpha, int stride_h, int stride_w)
{
    // output dimensions
    int output_h = input_h - (kernel_h - 1) * stride_h;
    int output_w = input_w - (kernel_w - 1) * stride_w;

    // this thread only processes one output, defined by the block Ids
    int kk = blockIdx.x;
    int ii = blockIdx.y;

    // batch id and kernel id
    int batch = blockIdx.z;
    int kid = threadIdx.x;

    // shared memory for output reduction
    extern __shared__ float shared_output[];

    // calculate output starting index for this thread
    int output_idx = (kk * input_n + batch) * output_h * output_w;

    // convolution loop
    for (int yy = threadIdx.y; yy < output_h; yy += blockDim.y) {
        for (int xx = kid; xx < output_w; xx += blockDim.x) {
            // Dot product in two dimensions (between input image and kernel)
            float sum = 0;
            for (int ky = 0; ky < kernel_h; ky++) {
                for (int kx = 0; kx < kernel_w; kx++) {
                    int input_x = xx * stride_w + kx;
                    int input_y = yy * stride_h + ky;
                    int input_idx = (ii * input_n + batch) * input_h * input_w + input_y * input_w + input_x;
                    int kernel_idx = (kk * kernel_n + ii) * kernel_h * kernel_w + ky * kernel_w + kx;
                    sum += input[input_idx] * kernel[kernel_idx];
                }
            }
            shared_output[yy * output_w + xx] = sum;
        }
    }

    __syncthreads();

    // reduce across block
    if (kid == 0) {
        for (int yy = 0; yy < output_h; yy++) {
            for (int xx = 0; xx < output_w; xx++) {
                float total = 0;
                for (int i = 0; i < blockDim.x; i++) {
                    total += shared_output[yy * output_w + i * output_w + xx];
                }
                output[output_idx + yy * output_w + xx] += alpha * total;
            }
        }
    }
}