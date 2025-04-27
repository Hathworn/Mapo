#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcConvolutionUpdateWeightsGPU(float *filters, float *filter_grads, int in_size_z, int number_filters, int kernel_size, float momentum, float decay, float learning_rate, int elements) {
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    // Ensure thread operates within bounds
    if (id < elements) {
        int temp_id = id;
        int i = temp_id % kernel_size;
        temp_id /= kernel_size;
        int j = temp_id % kernel_size;
        temp_id /= kernel_size;
        int z = temp_id % in_size_z;
        temp_id /= in_size_z;
        int filter = temp_id;

        // Precompute constants for array offsets
        int filter_size = kernel_size * kernel_size * in_size_z;
        int filter_grad_index = (filter * filter_size + z * (kernel_size * kernel_size) + j * kernel_size + i) * 2;
        
        // Retrieve gradients and compute the momentum update
        float grad = filter_grads[filter_grad_index];
        float grad_prev = filter_grads[filter_grad_index + 1];
        float m = grad + grad_prev * momentum;
        filter_grads[filter_grad_index + 1] = m;

        // Update weight with learning rate and decay
        float w = filters[id];
        w -= learning_rate * (m + decay * w);
        filters[id] = w;
    }
}