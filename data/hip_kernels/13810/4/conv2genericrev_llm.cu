#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv2genericrev(float *input, float *kernel, float *output, int input_n, int input_h, int input_w, int kernel_n, int kernel_h, int kernel_w, float alpha, int stride_h, int stride_w)
{
    // output dimensions
    int output_h = input_h - (kernel_h - 1) * stride_h;
    int output_w = input_w - (kernel_w - 1) * stride_w;

    // Calculate overall thread index
    int tid = threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y;

    // one thread only sees one output
    output = output + (blockIdx.x * input_n + blockIdx.y) * output_h * output_w;

    // put the output in shared memory
    extern __shared__ float shared_output[];
    
    // Initialize shared memory
    if (tid < output_w * output_h) {
        shared_output[tid] = 0.0f;
    }
    __syncthreads();

    // convolution loop
    for (int yy = threadIdx.y; yy < output_h; yy += blockDim.y) {
        for (int xx = threadIdx.x; xx < output_w; xx += blockDim.x) {
            // Initialize sum accumulation
            float sum = 0.0f;
            float *input_p = input + (blockIdx.y * input_n + threadIdx.z) * input_h * input_w + yy * stride_h * input_w + xx * stride_w;
            float *kernel_p = kernel + (blockIdx.x * kernel_n + threadIdx.z) * kernel_w * kernel_h;
            for (int ky = 0; ky < kernel_h; ky++) {
                #pragma unroll
                for (int kx = 0; kx < kernel_w; kx++) {
                    sum += input_p[kx] * kernel_p[kx];
                }
                input_p += input_w;
                kernel_p += kernel_w;
            }
            shared_output[yy * output_w + xx] += sum;
        }
    }

    // Wait for all threads to finish writing to shared memory
    __syncthreads();

    // Batch reduction and writing back to global memory
    if (threadIdx.y == 0 && threadIdx.x == 0) {
        for (int i = tid; i < output_w * output_h; i += blockDim.x * blockDim.y * blockDim.z) {
            output[i] += alpha * shared_output[i];
        }
    }
}