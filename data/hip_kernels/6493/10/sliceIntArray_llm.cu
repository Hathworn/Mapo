#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sliceIntArray(const int n, const int indx, const int *ss, int *zz) {
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a loop for better load balancing in case n is much larger than blockDim.x
    for (int j = i; j < n; j += blockDim.x * gridDim.x) {
        zz[j] = ss[j + indx];
    }
}