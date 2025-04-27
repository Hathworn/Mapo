#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    // Using shared memory for reduction buffer to optimize memory access
    __shared__ float shared_buffer[SOFTMAX_NUM_THREADS];
    
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;

    const int thread_id = threadIdx.x;
    float temp_sum = 0;

    // Parallelized reduction calculation
    for (int i = thread_id; i < dim; i += blockDim.x) {
        temp_sum += dY[i] * Y[i];
    }
    shared_buffer[thread_id] = temp_sum;
    __syncthreads();

    // Use a single warp to finalize reduction which may increase efficiency
    if (thread_id < warpSize) {
        for (int offset = warpSize; offset < blockDim.x; offset += warpSize) {
            shared_buffer[thread_id] += shared_buffer[thread_id + offset];
        }
    }

    __syncthreads();

    // Compute gradient with the reduced sum
    temp_sum = shared_buffer[0];
    for (int i = thread_id; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - temp_sum);
    }
}