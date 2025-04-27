#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dense_kernel(int num_input, int num_output, double* gpu_in, double* weights, double* biases, double* gpu_out, int num_classes)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid >= num_output) return;

    double sum = biases[tid]; // Initialize with bias directly
    // Loop unrolling for optimization
    int count = 0;
    for (; count <= num_input - 4; count += 4) {
        sum += gpu_in[count] * weights[tid * num_input + count];
        sum += gpu_in[count + 1] * weights[tid * num_input + count + 1];
        sum += gpu_in[count + 2] * weights[tid * num_input + count + 2];
        sum += gpu_in[count + 3] * weights[tid * num_input + count + 3];
    }
    for (; count < num_input; count++) {
        sum += gpu_in[count] * weights[tid * num_input + count];
    }
    
    // Use ternary operator for compact ReLU activation
    gpu_out[tid] = (num_output != num_classes && sum < 0.0) ? 0.0 : sum;
}