#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define IDX2C(i, j, ld) ((j)*(ld)+(i))
#define SQR(x)      ((x)*(x))                        // x^2

__global__ void cutoff_log_kernel(double* device_array, double min_signal) {
    int thread_id = blockIdx.x * blockDim.x + threadIdx.x;
    double value = device_array[thread_id];
    // Use ternary operator for concise conditional assignment
    device_array[thread_id] = log(value < min_signal ? min_signal : value);
}