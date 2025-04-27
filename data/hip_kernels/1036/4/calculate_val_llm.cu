#include "hip/hip_runtime.h"
#include "includes.h"

double* x;
int numSMs;

__device__ double sqr(double x) {
    return x * x;
}

__global__ void calculate_val(double* devx, double* val, int size) {
    // Calculate unique thread index across the entire grid
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a stride loop to cover all elements with this thread
    int stride = blockDim.x * gridDim.x;
    while (index < size) {
        int pre = index - 1; 
        if (pre < 0) pre += size;
        int next = index + 1;
        if (next >= size) next -= size;
        val[index] = sqr(sin(devx[pre] * devx[index])) * sqr(sin(devx[next] * devx[index]));
        index += stride; // Increment by stride for the next iteration
    }
}