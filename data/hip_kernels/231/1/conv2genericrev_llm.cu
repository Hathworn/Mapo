```c
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

    // batch id
    int batch = threadIdx.z;

    // kernel id
    int kid = threadIdx.x;
    int nkids = blockDim.x;

    // thread ID
    int tid = kid + batch * blockDim.x;
    int nthreads = blockDim.x * blockDim.z;

    // one thread only sees one output
    output = output + (kk * input_n + ii) * output_h * output_w;

    // put the output in shared memory
    extern __shared__ float shared_output[]; // Use dynamic shared memory

    // generate tid outputs in shared memory
    float *output_s = shared_output + tid * output_w * output_h;

    // convolution loop
    int xx, yy, kx, ky;
    yy = threadIdx.y;
    float *output_p = output_s + yy * output_w;
    float *input_offset = input + (ii + batch * input_n) * input_h * input_w;
    float *kernel_offset = kernel + (kk + batch * kernel_n) * kernel_w * kernel_h;
    
    for (xx = 0; xx < output_w; xx++) {
        float *input_p = input_offset + yy * stride_h * input_w + xx * stride_w;
        float *kernel_p = kernel_offset;
        float sum = 0.0f;

        for (ky = 0; ky < kernel_h; ky++) {
            for (kx = kid; kx < kernel_w; kx += nkids) {
                sum += input_p[kx] * kernel_p[kx];
            }
            input_p += input_w;
            kernel_p += kernel_w;
        }
        *(output_p++) = sum;
    }
    __syncthreads();

    // reduce and write back
    if (yy == 0) {
        // reduce outputs
        for (int k = 1; k < nthreads; k++) {
            float *shared_output_k = shared_output + k * output_h * output_w;
            for (int i = tid; i < output_w * output_h; i += nthreads) {
                shared_output[i] += shared_output_k[i];
            }
        }
        __syncthreads();

        // add existing output and write back
        for (int i = tid; i < output_w * output_h; i += nthreads) {
            output[i] += alpha * shared_output[i];
        }
    }
}