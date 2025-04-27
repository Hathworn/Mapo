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

    // thread indices
    int batch = threadIdx.z;
    int kid = threadIdx.x;

    // compute shared memory size
    int shared_mem_size = output_h * output_w;

    // one thread only sees one output
    output = output + (kk * input_n + ii) * shared_mem_size;

    // allocate shared memory
    extern __shared__ float shared_output[];

    // generate tid outputs in shared memory
    int tid = threadIdx.x + threadIdx.z * blockDim.x;
    float *output_s = shared_output + tid * shared_mem_size;

    int yy = threadIdx.y;
    output_s += yy * output_w;
    
    // convolution loop
    for (int xx = 0; xx < output_w; xx++) {
        // Pointers for input and kernel
        float *input_p = input + (ii + batch * input_n) * input_h * input_w + yy * stride_h * input_w + xx * stride_w;
        float *kernel_p = kernel + (kk + batch * kernel_n) * kernel_w * kernel_h;
        float sum = 0;

        // Inner convolution loop using strided access
        for (int ky = 0; ky < kernel_h; ky++) {
            for (int kx = kid; kx < kernel_w; kx += blockDim.x) {
                sum += input_p[kx] * kernel_p[kx];
            }
            input_p += input_w;
            kernel_p += kernel_w;
        }
        *(output_s++) = sum;
    }
    __syncthreads();

    // reduce and write back
    if (yy == 0) {
        // reduce outputs
        for (int i = tid; i < shared_mem_size; i += blockDim.x * blockDim.z) {
            shared_output[i] = 0;
            for (int k = 0; k < blockDim.x * blockDim.z; k++) {
                shared_output[i] += shared_output[k * shared_mem_size + i];
            }
        }
        __syncthreads();

        // add existing output, and write back
        for (int i = tid; i < shared_mem_size; i += blockDim.x * blockDim.z) {
            output[i] += alpha * shared_output[i];
        }
    }
}