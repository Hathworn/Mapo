#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv2genericrev(float *input, float *kernel, float *output, int input_n, int input_h, int input_w, int kernel_n, int kernel_h, int kernel_w, float alpha, int stride_h, int stride_w) 
{
    // compute output dimensions
    int output_h = input_h - (kernel_h - 1) * stride_h;
    int output_w = input_w - (kernel_w - 1) * stride_w;

    // process one output defined by block Ids
    int kk = blockIdx.x;  // kernel index
    int ii = blockIdx.y;  // input index

    // batch id
    int batch = threadIdx.z;

    // kernel id
    int kid = threadIdx.x;
    int nkids = blockDim.x;

    // thread ID
    int tid = kid + batch*blockDim.x;
    int nthreads = blockDim.x * blockDim.z;

    // pointer to this thread's output position
    output = output + (kk * input_n + ii) * output_h * output_w;

    // allocate shared memory for outputs
    extern __shared__ float shared_output[];

    // generate thread outputs in shared memory
    float *output_s = shared_output + tid * output_w * output_h;

    // convolution loop
    int xx, kx, ky;
    float output_p[output_w]; // local output accumulator

    // iterate over the input height dimension
    for (int yy = threadIdx.y; yy < output_h; yy += blockDim.y) {
        // load the current output pointer
        float *input_p = input + ((ii + batch * input_n) * input_h + yy * stride_h) * input_w;
        float *kernel_p = kernel + ((kk + batch * kernel_n) * kernel_h) * kernel_w;

        // reset the output accumulator
        for (xx = 0; xx < output_w; xx++) {
            output_p[xx] = 0.0f;
        }

        // perform the convolution
        for (ky = 0; ky < kernel_h; ky++) {
            for (kx = kid; kx < kernel_w; kx += nkids) {
                float val = kernel_p[ky * kernel_w + kx];
                for (xx = 0; xx < output_w; xx++) {
                    output_p[xx] += input_p[xx * stride_w + kx] * val;
                }
            }
            input_p += input_w; // move to next row in input
        }

        // store the output in shared memory
        for (xx = 0; xx < output_w; xx++) {
            output_s[yy * output_w + xx] = output_p[xx];
        }
    }

    __syncthreads();

    // reduce and write back
    if (threadIdx.y == 0 && tid < output_h * output_w) {
        // reduce outputs across all threads
        for (int k = nthreads; k < nthreads; k += nthreads) {
            shared_output[tid] += shared_output[k * output_h * output_w + tid];
        }
        __syncthreads();

        // add existing output and write back via alpha scaling
        output[tid] += alpha * shared_output[tid];
    }
}