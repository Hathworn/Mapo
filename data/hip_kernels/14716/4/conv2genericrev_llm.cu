#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void conv2genericrev(float *input, float *kernel, float *output, int input_n, int input_h, int input_w, int kernel_n, int kernel_h, int kernel_w, float alpha, int stride_h, int stride_w)
{
    // output dimensions
    int output_h = input_h - (kernel_h - 1) * stride_h;
    int output_w = input_w - (kernel_w - 1) * stride_w;

    // global thread indices
    int kk = blockIdx.x;
    int ii = blockIdx.y;
    int batch = threadIdx.z;
    int kid = threadIdx.x;
    int nkids = blockDim.x;
    int tid = kid + batch * nkids;
    int nthreads = blockDim.x * blockDim.z;

    // pointer offset for output
    output = output + (kk * input_n + ii) * output_h * output_w;

    // shared memory allocation
    extern __shared__ float shared_output[];

    // pointer for each thread's output in shared memory
    float *output_s = shared_output + tid * output_w * output_h;

    // convolution loop
    for (int yy = threadIdx.y; yy < output_h; yy += blockDim.y) {
        float *output_p = output_s + yy * output_w;
        for (int xx = 0; xx < output_w; xx++) {
            float *input_p = input + (ii + batch * input_n) * input_h * input_w + yy * stride_h * input_w + xx * stride_w;
            float *kernel_p = kernel + (kk + batch * kernel_n) * kernel_w * kernel_h;
            float sum = 0;
            for (int ky = 0; ky < kernel_h; ky++) {
                for (int kx = kid; kx < kernel_w; kx += nkids) {
                    // accumulate convolution sum
                    sum += input_p[kx] * kernel_p[kx];
                }
                input_p += input_w;
                kernel_p += kernel_w;
            }
            *output_p++ = sum;
        }
    }
    __syncthreads();

    // reduction across threads
    if (threadIdx.y == 0) {
        for (int k = 1; k < nthreads; k++) {
            for (int i = tid; i < output_w * output_h; i += nthreads) {
                shared_output[i] += shared_output[k * output_h * output_w + i];
            }
        }
        __syncthreads();

        // update output with scaled shared output
        for (int i = tid; i < output_w * output_h; i += nthreads) {
            output[i] += alpha * shared_output[i];
        }
    }
}