#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void prefixSumBackward(float* arr, int step) {
    // Improved indexing calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int ii = i + 1;

    // Use of shared memory could be considered for further performance improvement
    if (ii <= n / step) {
        int idx = ii * step - 1;
        int halfStepIdx = ii * step - step / 2 - 1;

        // Use register variables for temporary storage
        int temp = arr[idx];
        arr[idx] += arr[halfStepIdx];
        arr[halfStepIdx] = temp;
    }
}