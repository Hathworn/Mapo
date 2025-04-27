#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void add_gpu(int *device_var, int val) {
    atomicAdd(device_var, val);
}

__global__ void add_gpu(int *device_arr, int device_idx, int val) {
    // Using atomic operation to ensure safe concurrent updates
    atomicAdd(&(device_arr[device_idx]), val);
}