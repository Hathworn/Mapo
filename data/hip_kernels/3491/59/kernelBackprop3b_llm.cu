#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelBackprop3b(float *delta_nabla_b, int b_off, float *zs) {
    // Cache zs[threadIdx.x] value to reduce memory access
    float z = zs[threadIdx.x];
    // Calculate sigmoid(z) once and reuse for derivative
    float sigmoid_z = 1.0f / (1.0f + expf(-z));
    // Update delta_nabla_b using precomputed sigmoid value
    delta_nabla_b[b_off + threadIdx.x] *= sigmoid_z * (1.0f - sigmoid_z);
}