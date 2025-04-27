#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAddKernel(float* __restrict__ A, float* __restrict__ B, float* __restrict__ Result) {
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform vector addition
    if (i < N) { // Assuming N is the total number of elements, consider boundary check
        Result[i] = __fadd_rn(A[i], B[i]); // Use faster intrinsic function for addition
    }
}