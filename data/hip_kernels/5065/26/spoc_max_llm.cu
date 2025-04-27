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
    // Use shared memory to store max values
    extern __shared__ double shared_max[];

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize shared memory
    shared_max[threadIdx.x] = (i < size) ? fabs(input[i]) : 0.0;
    __syncthreads();

    // Reduce to find the maximum
    for (unsigned int s = 1; s < blockDim.x; s *= 2) {
        if (threadIdx.x % (2 * s) == 0 && (threadIdx.x + s) < blockDim.x) {
            if (shared_max[threadIdx.x] < shared_max[threadIdx.x + s]) {
                shared_max[threadIdx.x] = shared_max[threadIdx.x + s];
            }
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0) {
        atomicMax((unsigned long long int*)&output[0], __double_as_longlong(shared_max[0]));
    }
}