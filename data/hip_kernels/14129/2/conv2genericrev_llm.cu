```cuda
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void conv2genericrev(float *input, float *kernel, float *output, int input_n, int input_h, int input_w, int kernel_n, int kernel_h, int kernel_w, float alpha, int stride_h, int stride_w)
{
    // output dimensions
    int output_h = input_h - (kernel_h - 1) * stride_h;
    int output_w = input_w - (kernel_w - 1) * stride_w;

    // this thread only processes one output
    int kk = blockIdx.x;
    int ii = blockIdx.y;

    // batch id
    int batch = threadIdx.z;

    // kernel id
    int kid = threadIdx.x;
    int nkids = blockDim.x;

    // thread ID
    int tid = kid + batch*blockDim.x;
    int nthreads = blockDim.x * blockDim.z;

    // offset for the output pointer
    output += (kk * input_n + ii) * output_h * output_w;

    // use shared memory for partial outputs
    extern __shared__ float shared_output[];

    // separate pointer per thread to avoid index recalculation
    float* output_s = shared_output + tid * output_w * output_h;

    // convolution computation
    int xx, yy = threadIdx.y;
    float *output_p = output_s + yy * output_w;
    for (xx = 0; xx < output_w; xx++) {
        // calculation of input and kernel pointers
        float *input_p = input + (ii + batch * input_n) * input_h * input_w + yy * stride_h * input_w + xx * stride_w;
        float *kernel_p = kernel + (kk + batch * kernel_n) * kernel_w * kernel_h;
        float sum = 0;

        // parallelizing kx loop over threads
        for (int ky = 0; ky < kernel_h; ky++) {
            for (int kx = kid; kx < kernel_w; kx += nkids) {
                sum += input_p[kx] * kernel_p[kx];
            }
            input_p += input_w;
            kernel_p += kernel_w;
        }
        output_p[xx] = sum;
    }

    __syncthreads();

    // reducing shared memory results
    if (yy == 0) {
        for (int k = 1; k < nthreads; k++) {
            for (int i = tid; i < output_w * output_h; i += nthreads) {
                shared_output[i] += shared_output[k * output_h * output_w + i];
            }
        }
        __syncthreads();

        // combining with existing output and storing results
        for (int i = tid; i < output_w * output_h; i += nthreads) {
            output[i] += alpha * shared_output[i];
        }
    }
}