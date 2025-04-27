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
    
    // Pointer update for the output
    output = output + (kk * input_n + ii) * output_h * output_w;
    
    // Shared memory for output
    __shared__ float shared_output[CUDA_SHARED_MEM_SIZE];
    
    // Initialize shared memory array
    float *output_s = shared_output + tid * output_w * output_h;
    
    // Convolution loop
    float *input_p, *kernel_p, *output_p;
    int xx, yy, kx, ky;
    yy = threadIdx.y;
    output_p = output_s + yy * output_w;
    for(xx = 0; xx < output_w; xx++) {
        // Calculate dot product between input image and kernel
        input_p = input + (ii + batch * input_n) * input_h * input_w + yy * stride_h * input_w + xx * stride_w;
        kernel_p = kernel + (kk + batch * kernel_n) * kernel_w * kernel_h;
        float sum = 0;
        
        // Loop for kernel height
        for(ky = 0; ky < kernel_h; ky++) {
            // Loop for kernel width with step equal to nkids
            for(kx = kid; kx < kernel_w; kx += nkids) {
                sum += input_p[kx] * kernel_p[kx];
            }
            input_p += input_w;
            kernel_p += kernel_w;
        }
        
        // Store result in shared memory
        *(output_p++) = sum;
    }
    __syncthreads();
    
    // Reduce and write back
    if (yy == 0) {
        // Reduce outputs and aggregate results
        for (int k = 1; k < nthreads; k++) {
            for (int i = tid; i < output_w * output_h; i += nthreads) {
                shared_output[i] += shared_output[k * output_h * output_w + i];
            }
        }
        __syncthreads();
        
        // Update existing output and write back
        for (int i = tid; i < output_w * output_h; i += nthreads) {
            output[i] += alpha * shared_output[i];
        }
    }
}