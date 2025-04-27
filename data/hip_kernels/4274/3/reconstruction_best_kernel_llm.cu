#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 256
#define EPS 1e-4

__global__ void reconstruction_best_kernel(float *input, float *filtered_affine_model, float *filtered_best_output, int h, int w) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;
    
    if (id < size) {
        // Use shared memory for affine model
        __shared__ float shared_affine_model[12];
        
        // Load the affine model into shared memory
        if (threadIdx.x < 12) {
            shared_affine_model[threadIdx.x] = filtered_affine_model[id * 12 + threadIdx.x];
        }
        __syncthreads();
        
        // Compute outputs
        double out1 = input[id + 2*size] * shared_affine_model[0] +
                      input[id + size] * shared_affine_model[1] +
                      input[id] * shared_affine_model[2] +
                      shared_affine_model[3];
                      
        double out2 = input[id + 2*size] * shared_affine_model[4] +
                      input[id + size] * shared_affine_model[5] +
                      input[id] * shared_affine_model[6] +
                      shared_affine_model[7];
                      
        double out3 = input[id + 2*size] * shared_affine_model[8] +
                      input[id + size] * shared_affine_model[9] +
                      input[id] * shared_affine_model[10] +
                      shared_affine_model[11];
                      
        // Store the results
        filtered_best_output[id] = out1;
        filtered_best_output[id + size] = out2;
        filtered_best_output[id + 2*size] = out3;
    }
}