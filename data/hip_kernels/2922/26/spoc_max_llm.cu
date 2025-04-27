#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

/****** Single precision *****/

/****** Double precision *****/

#ifdef __cplusplus
}
#endif

__global__ void spoc_max(const double* input, double* output, const int size)
{
    // Use shared memory to store intermediate maximums
    extern __shared__ double shared_data[];

    // Each thread loads one element into shared memory
    int tid = threadIdx.x;
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < size) {
        shared_data[tid] = fabs(input[i]);
    } else {
        shared_data[tid] = -INFINITY; // Handle out-of-bound threads
    }
    __syncthreads();

    // Perform reduction to find the maximum in each block
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            shared_data[tid] = fmax(shared_data[tid], shared_data[tid + s]);
        }
        __syncthreads();
    }

    // Store block result in global memory by the first thread
    if (tid == 0) {
        output[blockIdx.x] = shared_data[0];
    }
}