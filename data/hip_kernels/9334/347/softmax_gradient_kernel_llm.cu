#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    
    // Load and compute initial product in registers for efficiency
    float tmp = 0.0f;
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Reduce sum with loop unrolling (performance optimization)
    if (blockDim.x >= 1024 && idx < 512) reduction_buffer[idx] += reduction_buffer[idx + 512];
    __syncthreads();
    if (blockDim.x >= 512 && idx < 256) reduction_buffer[idx] += reduction_buffer[idx + 256];
    __syncthreads();
    if (blockDim.x >= 256 && idx < 128) reduction_buffer[idx] += reduction_buffer[idx + 128];
    __syncthreads();
    if (blockDim.x >= 128 && idx < 64) reduction_buffer[idx] += reduction_buffer[idx + 64];
    __syncthreads();

    if (idx < 32) {
        volatile float* vsmem = reduction_buffer; // volatile shared memory
        vsmem[idx] += vsmem[idx + 32];
        vsmem[idx] += vsmem[idx + 16];
        vsmem[idx] += vsmem[idx + 8];
        vsmem[idx] += vsmem[idx + 4];
        vsmem[idx] += vsmem[idx + 2];
        vsmem[idx] += vsmem[idx + 1];
    }
    __syncthreads();

    // Compute gradient using reduced result
    if (idx == 0) {
        reduction_buffer[0] = reduction_buffer[0]; // Store result
    }
    __syncthreads();

    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}