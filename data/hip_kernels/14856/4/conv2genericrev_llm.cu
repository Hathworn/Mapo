#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void conv2genericrev(float *input, float *kernel, float *output, int input_n, int input_h, int input_w, int kernel_n, int kernel_h, int kernel_w, float alpha, int stride_h, int stride_w)
{
    // Output dimensions
    int output_h = input_h - (kernel_h - 1) * stride_h;
    int output_w = input_w - (kernel_w - 1) * stride_w;

    // Thread indices
    int kk = blockIdx.x;
    int ii = blockIdx.y;

    // Batch and kernel id
    int batch = threadIdx.z;
    int kid = threadIdx.x;
    int nkids = blockDim.x;

    // Linear thread ID for kernel calculations
    int tid = kid + batch * blockDim.x;
    int nthreads = blockDim.x * blockDim.z;

    // Output index and shared memory pointer
    output = output + (kk * input_n + ii) * output_h * output_w;
    extern __shared__ float shared_output[]; // Use dynamic shared memory

    // Initialize shared memory to zero
    float *output_s = shared_output + tid * output_w;
    for (int i = 0; i < output_w; ++i)
        output_s[i] = 0.0;

    // Convolution loop
    for (int yy = threadIdx.y; yy < output_h; yy += blockDim.y) {
        float *output_p = output_s;
        for (int xx=0; xx < output_w; xx++) {
            float *input_p = input + (ii + batch * input_n) * input_h * input_w + yy * stride_h * input_w + xx * stride_w;
            float *kernel_p = kernel + (kk + batch * kernel_n) * kernel_w * kernel_h;
            
            float sum = 0;
            for (int ky = 0; ky < kernel_h; ky++) {
                for (int kx = kid; kx < kernel_w; kx += nkids) {
                    sum += input_p[kx] * kernel_p[kx];
                }
                input_p += input_w;
                kernel_p += kernel_w;
            }
            output_p[xx] += sum;
        }
    }
    __syncthreads();

    // Reduce outputs and write back
    if (yy == 0) {
        // Reduce outputs for all threads
        for (int k = 1; k < nthreads; k++) {
            for (int i = tid; i < output_w * output_h; i += nthreads) {
                shared_output[i] += shared_output[k * output_h * output_w + i];
            }
        }
        __syncthreads();

        // Add existing output, and write back
        for (int i = tid; i < output_w * output_h; i += nthreads) {
            output[i] += alpha * shared_output[i];
        }
    }
}