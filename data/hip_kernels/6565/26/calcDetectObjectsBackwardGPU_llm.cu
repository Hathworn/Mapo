#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float activator_derivative(float x)
{
    float sig = 1.0f / (1.0f + exp(-x));
    return sig * (1 - sig);
}

__global__ void calcDetectObjectsBackwardGPU(float *dz_in, float *dz, float *in, int batch_size, int in_size_x, int in_size_y, int in_size_z, int max_bounding_boxes, int max_classes)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

    int index_stride = in_size_x * in_size_y * in_size_z;

    if (id < batch_size * index_stride / (4 + max_classes)) { // Ensure id is within bounds
        for (int i = 0; i < max_bounding_boxes; i += (4 + max_classes)) {
            int index = id * index_stride + i;

            dz[index] = activator_derivative(in[index]) * dz_in[index]; // x: sigmoid derivative * grads
            dz[index + 1] = activator_derivative(in[index + 1]) * dz_in[index + 1]; // y: sigmoid derivative * grads
            dz[index + 2] = exp(in[index + 2]) * dz_in[index + 2]; // w: exp * grads
            dz[index + 3] = exp(in[index + 3]) * dz_in[index + 3]; // h: exp * grads

            for (int c = 0; c < max_classes; ++c) {
                int index2 = index + 4 + c;
                dz[index2] = activator_derivative(in[index2]) * dz_in[index2]; // id: sigmoid derivative * grads
            }
        }
    }
}