#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subsample(float *input, float *output, float *weight, float *bias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW)
{
    // Calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // Calculate offsets based on thread/block ID
    int o = blockIdx.x;
    int k = blockIdx.x % input_n;

    int xx_start = threadIdx.x;
    int yy_start = blockDim.y * blockIdx.y + threadIdx.y;

    // Select input/output plane; weights and biases
    float *local_output = output + o * output_w * output_h;
    float *local_input = input + o * input_w * input_h;
    float the_weight = weight[k];
    float the_bias = bias[k];

    // Optimize by using shared memory
    __shared__ float shared_input[32*32];  // Adjust size as needed
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Load into shared memory
    for (int yy = yy_start; yy < output_h; yy+=blockDim.y*gridDim.y) {
        for (int xx = xx_start; xx < output_w; xx+=blockDim.x) {
            int input_index = (yy * dH) * input_w + (xx * dW);
            shared_input[ty * blockDim.x + tx] = local_input[input_index];

            __syncthreads();  // Ensure all threads have written to shared memory

            float sum = 0;
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    sum += shared_input[(ty * dH + ky) * blockDim.x + (tx * dW + kx)];
                }
            }
            // Update output
            local_output[yy * output_w + xx] = the_weight * sum + the_bias;
        }
    }
}