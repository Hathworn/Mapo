#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DeviceMultiply(double* left, double* right, double* result, int left_rows, int left_cols, int right_cols) {
    int i = threadIdx.y + blockIdx.y * blockDim.y;
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check if thread indices are within matrix bounds
    if (i < left_rows && j < right_cols) {
        double sum = 0.0;
        // Use registers instead of shared memory
        for (int k = 0; k < left_cols; ++k) {
            int left_idx = i * left_cols + k;
            int right_idx = k * right_cols + j;
            sum += left[left_idx] * right[right_idx];
        }
        int result_idx = i * right_cols + j;
        result[result_idx] = sum;
    }
}