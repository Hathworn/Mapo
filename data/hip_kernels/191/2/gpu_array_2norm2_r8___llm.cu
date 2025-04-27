#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_array_2norm2_r8__(size_t arr_size, const double *arr, double *bnorm2)
/** Computes the squared Euclidean (Frobenius) norm of an array arr(0:arr_size-1)
INPUT:
# arr_size - size of the array;
# arr(0:arr_size-1) - array;
OUTPUT:
# bnorm2[0:gridDim.x-1] - squared 2-norm of a sub-array computed by each CUDA thread block;
**/
{
    size_t i, n;
    double _thread_norm2 = 0.0;
    extern __shared__ double thread_norms2_r8[];

    // Calculate global index and stride
    n = blockDim.x * gridDim.x;
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Compute squared norm for assigned elements
    for (i = index; i < arr_size; i += n) {
        _thread_norm2 += arr[i] * arr[i];
    }
    
    // Store the thread result in shared memory
    thread_norms2_r8[threadIdx.x] = _thread_norm2;
    __syncthreads();

    // Reduce results within the block
    if (threadIdx.x == 0) {
        double block_norm2 = 0.0;
        for (i = 0; i < blockDim.x; i++) {
            block_norm2 += thread_norms2_r8[i];
        }
        bnorm2[blockIdx.x] = block_norm2;
    }
}