#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution_kernel(int h, int w, int d, double* gpu_in, int k_h, int k_w, int k_d, double* kernel_weights, double* kernel_biases, int num_kernels, int op_h, int op_w, int op_d, double* gpu_out)
{
    // Identifying threads by their IDs
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    int deep = blockDim.z * blockIdx.z + threadIdx.z;

    // Return if thread out of bounds
    if (row >= op_h || col >= op_w || deep >= op_d) return;

    double out = 0.0;

    // Avoid repeated calculations; directly compute the offsets
    int base_input_idx = h * w * deep;
    int base_kernel_idx = deep * k_h * k_w * k_d;

    #pragma unroll  // Use loop unrolling for potential performance increase
    for (int depth_pointer = 0; depth_pointer < k_d; ++depth_pointer) {
        int depth_offset = depth_pointer * h * w;
        for (int row_pointer = 0; row_pointer < k_h; ++row_pointer) {
            int row_offset = row_pointer * w;
            for (int column_pointer = 0; column_pointer < k_w; ++column_pointer) {
                out += gpu_in[(row * w + col) + column_pointer + row_offset + depth_offset] * kernel_weights[column_pointer + row_pointer * k_w + depth_pointer * k_h*k_w + base_kernel_idx];
            }
        }
    }

    // Bias addition and ReLU activation
    double result = out + kernel_biases[deep];
    gpu_out[row * op_w + col + deep * op_h * op_w] = (result < 0.0) ? 0.0 : result;
}