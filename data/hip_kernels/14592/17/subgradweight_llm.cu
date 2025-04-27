#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subgradweight(float *input, float *gradOutput, float *gradWeight, float *gradBias, int input_n, int input_h, int input_w, int kH, int kW, int dH, int dW, float scale)
{
    // calculate output dimensions
    int output_w = (input_w - kW) / dW + 1;
    int output_h = (input_h - kH) / dH + 1;

    // get the current output plane based on block ID
    int o = blockIdx.x;
    int i = o;
    int k = blockIdx.x % input_n;

    // pointers for current plane
    gradOutput += o * output_w * output_h;
    input += i * input_w * input_h;

    // thread ID for sums array
    int tid = threadIdx.y * blockDim.x + threadIdx.x;

    // allocate shared memory for partial sums
    extern __shared__ float shared_sums[];

    // initialize sums
    float local_sum = 0.0f;

    // calculate partial sums
    for (int yy = threadIdx.y; yy < output_h; yy += blockDim.y) {
        for (int xx = threadIdx.x; xx < output_w; xx += blockDim.x) {
            float *ptr_input = input + yy * dH * input_w + xx * dW;
            float z = gradOutput[yy * output_w + xx];
            for (int ky = 0; ky < kH; ky++) {
                for (int kx = 0; kx < kW; kx++) {
                    local_sum += z * ptr_input[kx];
                }
                ptr_input += input_w;
            }
        }
    }

    // store in shared memory and sync
    shared_sums[tid] = local_sum;
    __syncthreads();

    // accumulate partial sums to gradWeight
    if (tid == 0) {
        float block_sum = 0.0f;
        for (int i = 0; i < blockDim.x * blockDim.y; i++) {
            block_sum += shared_sums[i];
        }
        atomicAdd(&gradWeight[k], scale * block_sum);
    }
    __syncthreads();

    // compute gradBias using atomic operations
    local_sum = 0.0f;
    for (int i = tid; i < output_w * output_h; i += blockDim.x * blockDim.y) {
        local_sum += gradOutput[i];
    }

    // reduce gradBias using atomic add
    shared_sums[tid] = local_sum;
    __syncthreads();

    if (tid == 0) {
        float block_bias_sum = 0.0f;
        for (int i = 0; i < blockDim.x * blockDim.y; i++) {
            block_bias_sum += shared_sums[i];
        }
        atomicAdd(&gradBias[k], scale * block_bias_sum);
    }
}