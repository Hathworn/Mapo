#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prefixSumBackward(float* arr, int step, int n) { // Add 'n' as a parameter for boundary check
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Combine index calculation into a single line
    int ii = i + 1;

    if (i >= n || ii * step > n) return; // Fix the boundary condition

    int idx1 = ii * step - 1; // Store index calculations in variables for better readability
    int idx2 = ii * step - step / 2 - 1;

    float temp = arr[idx1];
    arr[idx1] += arr[idx2];
    arr[idx2] = temp;
}