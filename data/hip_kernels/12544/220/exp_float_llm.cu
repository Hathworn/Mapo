#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void exp_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int gridStride = blockDim.x * gridDim.x; // Calculate grid-stride to increase parallelism
    for (; i < n; i += gridStride) {
        if (i >= idx && i % incy == 0) {
            result[i] = cosf(dy[i]); // Efficient memory access within condition
        }
    }
}