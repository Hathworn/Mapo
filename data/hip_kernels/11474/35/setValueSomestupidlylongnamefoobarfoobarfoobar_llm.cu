#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void setValueSomestupidlylongnamefoobarfoobarfoobarhaha(float *data, int idx, float value) {
    data[idx] = value;
}

__device__ float bar(float a, float b) {
    return a + b;
}

__global__ void setValueSomestupidlylongnamefoobarfoobarfoobar(float *data, int idx, float value) {
    // Use blockIdx.x and blockDim.x to allow parallel threads to set values
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    if (globalIdx == idx) {
        setValueSomestupidlylongnamefoobarfoobarfoobarhaha(data, idx, value);
    }
}