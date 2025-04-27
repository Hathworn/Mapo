#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void modifyArrayKernel(int *val, int *arr) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < 6) { // Check i only once
        int current = arr[i];
        if (current > -1) {
            arr[i] = current - *val; // Minimize memory reads/writes
        }
    }
}