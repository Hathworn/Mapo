#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void setValueSomestupidlylongnamefoobarfoobarfoobarhaha(float *data, int idx, float value) {
    data[idx] = value;
}

__device__ float bar(float a, float b) {
    return a + b;
}

__global__ void setValueSomestupidlylongnamefoobarfoobarfoobar(float *data, int idx, float value) {
    // Optimize by handling multiple elements within a block
    int tid = threadIdx.x + blockDim.x * blockIdx.x;
    if(tid == 0) {
        setValueSomestupidlylongnamefoobarfoobarfoobarhaha(data, idx, value);
    }
}