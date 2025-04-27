#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_array_2norm2_r4__(size_t arr_size, const float *arr, float *bnorm2)
/** Computes the squared Euclidean (Frobenius) norm of an array arr(0:arr_size-1)
INPUT:
# arr_size - size of the array;
# arr(0:arr_size-1) - array;
OUTPUT:
# bnorm2[0:gridDim.x-1] - squared 2-norm of a sub-array computed by each CUDA thread block;
**/
{
    size_t n = gridDim.x * blockDim.x;
    float _thread_norm2 = 0.0f;
    extern __shared__ float thread_norms2_r4[];

    // Accumulate squared values for the assigned portion of the array
    for (size_t i = blockIdx.x * blockDim.x + threadIdx.x; i < arr_size; i += n) {
        _thread_norm2 += arr[i] * arr[i];
    }
    thread_norms2_r4[threadIdx.x] = _thread_norm2;
    __syncthreads();

    // Use a single thread to accumulate results and write to output
    if (threadIdx.x == 0) {
        float block_sum = 0.0f;
        for (size_t i = 0; i < blockDim.x; i++) {
            block_sum += thread_norms2_r4[i];
        }
        bnorm2[blockIdx.x] = block_sum;
    }
}