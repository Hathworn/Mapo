#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SoftmaxLossBackprop(const float *label, int num_labels, int batch_size, float *diff)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= batch_size) 
        return;

    const int label_value = static_cast<int>(label[idx]);

    // Utilize shared memory to coalesce global memory accesses
    extern __shared__ float shared_diff[];
    shared_diff[threadIdx.x] = diff[idx * num_labels + label_value];
    __syncthreads();

    // Decrease the result of the label's value by 1
    shared_diff[threadIdx.x] -= 1.0f;
    diff[idx * num_labels + label_value] = shared_diff[threadIdx.x];
}