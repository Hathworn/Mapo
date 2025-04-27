#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcDenseUpdateWeightsGPU(float *weights, float *biases, float *gradients, float *dW, float *dB, int batch_size, int in_size_x, int in_size_y, int in_size_z, int out_size_x, int out_size_y, int out_size_z, float learning_rate, float momentum)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id < out_size_x) {
        int w_size_x = in_size_x * in_size_y * in_size_z;

        // Use shared memory to reduce global memory access
        extern __shared__ float shared_dW[];
        
        for (int h = threadIdx.x; h < w_size_x; h += blockDim.x) {
            int index = h * out_size_x + id;
            shared_dW[h] = dW[index];
        }
        __syncthreads();
        
        for (int h = 0; h < w_size_x; ++h) {
            int index = h * out_size_x + id;
            weights[index] -= learning_rate * shared_dW[h];
        }
        
        biases[id] -= learning_rate * dB[id];
        
        // Unroll the loop for pipeline efficiency
        for (int b = 0; b < batch_size; b += 2) {
            int index1 = (b * out_size_x + id) * 2;
            int index2 = index1 + 2 * out_size_x;
            gradients[index1 + 1] = gradients[index1] + gradients[index1 + 1] * momentum;

            if (b + 1 < batch_size) {
                gradients[index2 + 1] = gradients[index2] + gradients[index2 + 1] * momentum;
            }
        }
    }
}