#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prefixSumForward(float* arr, int step, int n) {
    int bx = blockIdx.x;
    int tx = threadIdx.x;
    int BX = blockDim.x;
    int i = bx * BX + tx;
    int ii = i + 1;

    // Ensure index is within bounds and has work to do
    if (ii > n || ii <= n / float(step)) return;

    // Optimize memory access pattern
    arr[ii * step - 1] += arr[ii * step - step / 2 - 1];

    if (step == n && n - 1 == ii * step - 1) {
        arr[ii * step] = arr[ii * step - 1];
        arr[ii * step - 1] = 0;
    }
}