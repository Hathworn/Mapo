#include "hip/hip_runtime.h"
#include "includes.h"

hipEvent_t start, stop;

__global__ void cudaComputeAndNormalizeGradientLength(unsigned char *channel_values, int* x_gradient, int* y_gradient) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory for faster access within block (assuming input size is known and fits)
    __shared__ int shared_x[256];
    __shared__ int shared_y[256];
    
    // Load data into shared memory
    shared_x[threadIdx.x] = x_gradient[index];
    shared_y[threadIdx.x] = y_gradient[index];
    __syncthreads();  // Ensure all threads have loaded their data

    // Compute gradient length
    int x_grad = shared_x[threadIdx.x];
    int y_grad = shared_y[threadIdx.x];
    int gradient_length = __fsqrt_rn(float(x_grad * x_grad + y_grad * y_grad));

    // Normalize and store result
    channel_values[index] = min(gradient_length, 255);
}