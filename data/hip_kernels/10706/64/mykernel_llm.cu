#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mykernel(int *int1, float *f1, int *int2) {
    // Utilize shared memory for efficient data access
    __shared__ float sharedFloat;
    __shared__ int sharedInt;

    // Convert int to float and store in shared memory
    if (threadIdx.x == 0) {
        sharedFloat = __int_as_float(int1[0]);
    }
    __syncthreads();

    // Fetch from shared memory
    f1[0] = sharedFloat;

    // Convert float to int and store in shared memory
    if (threadIdx.x == 0) {
        sharedInt = __float_as_int(sharedFloat);
    }
    __syncthreads();

    // Fetch from shared memory
    int2[0] = sharedInt;
}