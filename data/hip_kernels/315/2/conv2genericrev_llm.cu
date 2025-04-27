#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv2genericrev(float *input, float *kernel, float *output, int input_n, int input_h, int input_w, int kernel_n, int kernel_h, int kernel_w, float alpha, int stride_h, int stride_w)
{
    // Calculate output dimensions
    int output_h = input_h - (kernel_h - 1) * stride_h;
    int output_w = input_w - (kernel_w - 1) * stride_w;

    // Output offset for the specific thread block
    int kk = blockIdx.x;
    int ii = blockIdx.y;
    output += (kk * input_n + ii) * output_h * output_w;

    // Setup shared memory
    __shared__ float shared_output[CUDA_SHARED_MEM_SIZE];

    // Simplify thread indexing
    int batch = blockIdx.z;
    int kid = threadIdx.x;
    int tid = threadIdx.y * blockDim.x + kid;
    int nthreads = blockDim.x * blockDim.y;

    // Define shared memory for outputs
    float* output_s = shared_output + tid * output_h * output_w;

    // Convolution computation
    for (int yy = threadIdx.y; yy < output_h; yy += blockDim.y) {
        float* output_p = output_s + yy * output_w;
        for (int xx = 0; xx < output_w; xx++) {
            float* input_p = input + (ii + batch * input_n) * input_h * input_w + yy * stride_h * input_w + xx * stride_w;
            float* kernel_p = kernel + (kk + batch * kernel_n) * kernel_w * kernel_h;
            float sum = 0;
            for (int ky = 0; ky < kernel_h; ky++, input_p += input_w, kernel_p += kernel_w) {
                for (int kx = kid; kx < kernel_w; kx += blockDim.x) {
                    sum += input_p[kx] * kernel_p[kx];
                }
            }
            output_p[xx] = sum;
        }
    }
    __syncthreads();

    // Reduction step within shared memory and write-back
    for (int i = tid; i < output_w * output_h; i += nthreads) {
        for (int k = 1; k < nthreads; k++) {
            shared_output[i] += shared_output[k * output_h * output_w + i];
        }
        output[i] += alpha * shared_output[i];
    }
}