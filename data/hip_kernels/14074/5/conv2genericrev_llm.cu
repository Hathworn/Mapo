```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv2genericrev(float *input, float *kernel, float *output, int input_n, int input_h, int input_w, int kernel_n, int kernel_h, int kernel_w, float alpha, int stride_h, int stride_w)
{
    // Output dimensions
    int output_h = input_h - (kernel_h - 1) * stride_h;
    int output_w = input_w - (kernel_w - 1) * stride_w;

    // Block Ids define which output this thread processes
    int kk = blockIdx.x;
    int ii = blockIdx.y;

    // Batch and kernel identifiers
    int batch = threadIdx.z;
    int kid = threadIdx.x;
    int nkids = blockDim.x;

    // Calculate thread ID and number of threads
    int tid = kid + batch*blockDim.x;
    int nthreads = blockDim.x * blockDim.z;

    // Advance output pointer to the current block's position
    output = output + (kk * input_n + ii) * output_h*output_w;

    // Shared memory for accumulating output
    extern __shared__ float shared_output[];
    float *output_s = shared_output + tid*output_w*output_h;

    // Convolution loop with each thread calculating partial outputs
    int xx, yy;
    yy = threadIdx.y;
    float *output_p = output_s + yy * output_w;
    for(xx=0; xx<output_w; xx++) {
        float *input_p = input + (ii + batch*input_n)*input_h*input_w + yy*stride_h*input_w + xx*stride_w;
        float *kernel_p = kernel + (kk + batch*kernel_n)*kernel_w*kernel_h;
        float sum = 0;
        
        // Optimize loop by allowing each thread to work on parts of the kernel
        for(int ky=0; ky<kernel_h; ky++) {
            float temp_sum = 0;
            for(int kx=kid; kx<kernel_w; kx+=nkids) {
                temp_sum += input_p[kx]*kernel_p[kx];
            }
            sum += temp_sum;
            input_p += input_w;
            kernel_p += kernel_w;
        }
        *(output_p++) = sum;
    }
    __syncthreads();

    // Reduce and write the final result back
    if (yy == 0) {
        for (int k=1; k<nthreads; k++) {
            for (int i=tid; i<output_w*output_h; i+=nthreads) {
                shared_output[i] += shared_output[k*output_h*output_w + i];
            }
        }
        __syncthreads();

        // Add existing output and write it back
        for (int i=tid; i<output_w*output_h; i+=nthreads) {
            output[i] += alpha*shared_output[i];
        }
    }
}