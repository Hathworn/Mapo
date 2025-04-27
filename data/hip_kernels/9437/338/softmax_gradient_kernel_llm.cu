#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel( const int dim, const float* Y, const float* dY, float* dX) {
    // Offset pointers to the current block
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // Unroll the loop to improve performance
    for (int i = idx; i < dim; i += blockDim.x * 4) {
        if (i < dim) tmp += dY[i] * Y[i];
        if (i + blockDim.x < dim) tmp += dY[i + blockDim.x] * Y[i + blockDim.x];
        if (i + 2 * blockDim.x < dim) tmp += dY[i + 2 * blockDim.x] * Y[i + 2 * blockDim.x];
        if (i + 3 * blockDim.x < dim) tmp += dY[i + 3 * blockDim.x] * Y[i + 3 * blockDim.x];
    }
    
    // Store partial results in shared memory
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Perform parallel reduction to sum results
    if (idx < 128) reduction_buffer[idx] += reduction_buffer[idx + 128];
    __syncthreads();
    if (idx < 64) reduction_buffer[idx] += reduction_buffer[idx + 64];
    __syncthreads();
    if (idx < 32) {
        // Utilize warp-level intrinsic reductions
        tmp = reduction_buffer[idx] + reduction_buffer[idx + 32];
        tmp += reduction_buffer[idx + 16];
        tmp += reduction_buffer[idx + 8];
        tmp += reduction_buffer[idx + 4];
        tmp += reduction_buffer[idx + 2];
        tmp += reduction_buffer[idx + 1];
        reduction_buffer[idx] = tmp;
    }
    __syncthreads();
    
    // Compute gradient using the reduced value
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x * 4) {
        if (i < dim) dX[i] = Y[i] * (dY[i] - tmp);
        if (i + blockDim.x < dim) dX[i + blockDim.x] = Y[i + blockDim.x] * (dY[i + blockDim.x] - tmp);
        if (i + 2 * blockDim.x < dim) dX[i + 2 * blockDim.x] = Y[i + 2 * blockDim.x] * (dY[i + 2 * blockDim.x] - tmp);
        if (i + 3 * blockDim.x < dim) dX[i + 3 * blockDim.x] = Y[i + 3 * blockDim.x] * (dY[i + 3 * blockDim.x] - tmp);
    }
}