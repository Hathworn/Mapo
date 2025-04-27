#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void conv2genericrev(float *input, float *kernel, float *output, int input_n, int input_h, int input_w, int kernel_n, int kernel_h, int kernel_w, float alpha, int stride_h, int stride_w)
{
    // Output dimensions
    int output_h = input_h - (kernel_h - 1) * stride_h;
    int output_w = input_w - (kernel_w - 1) * stride_w;

    // Block indices define which output this thread processes
    int kk = blockIdx.x;
    int ii = blockIdx.y;

    // Batch and kernel IDs
    int batch = threadIdx.z;
    int kid = threadIdx.x;
    int nkids = blockDim.x;

    // Compute thread ID and number of total threads
    int tid = kid + batch * blockDim.x;
    int nthreads = blockDim.x * blockDim.z;

    // Point to correct output position
    output += (kk * input_n + ii) * output_h * output_w;

    // Allocate shared memory for outputs
    extern __shared__ float shared_output[];

    // Initialize thread-local pointers and output position
    float *output_s = shared_output + tid * output_w * output_h;
    int yy = threadIdx.y;

    // Convolution loop
    float *output_p = output_s + yy * output_w;
    for (int xx = 0; xx < output_w; xx++) {
        // Initialize input and kernel pointers
        float *input_p = input + (ii + batch * input_n) * input_h * input_w + yy * stride_h * input_w + xx * stride_w;
        float *kernel_p = kernel + (kk + batch * kernel_n) * kernel_w * kernel_h;
        
        // Compute dot product
        float sum = 0.0f;
        for (int ky = 0; ky < kernel_h; ky++) {
            for (int kx = kid; kx < kernel_w; kx += nkids) {
                sum += input_p[kx] * kernel_p[kx];
            }
            input_p += input_w;
            kernel_p += kernel_w;
        }
        *(output_p++) = sum;
    }
    __syncthreads();

    // Reduction and writing back to global memory
    if (yy == 0) {
        // Reduction of outputs
        for (int k = 1; k < nthreads; k++) {
            for (int i = tid; i < output_w * output_h; i += nthreads) {
                shared_output[i] += shared_output[k * output_h * output_w + i];
            }
        }
        __syncthreads();

        // Update global output applying alpha
        for (int i = tid; i < output_w * output_h; i += nthreads) {
            output[i] += alpha * shared_output[i];
        }
    }
}