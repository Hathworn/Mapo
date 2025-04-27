#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void norm1_strided_double(int n, int xOffset, double *dx, int incx, double *result) {
    __shared__ double shared_result;  // Use shared memory for intermediate results
    if (threadIdx.x == 0) shared_result = 0.0;  // Initialize shared memory
    __syncthreads();

    double local_sum = 0.0;  // Use local register for thread's partial sum

    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        if (i >= xOffset && i % incx == 0)
            local_sum += abs(dx[i]);
    }

    atomicAdd(&shared_result, local_sum);  // Atomically add local sums to shared memory
    __syncthreads();

    if (threadIdx.x == 0)  // Single thread writes the result to global memory
        atomicAdd(result, shared_result);
}