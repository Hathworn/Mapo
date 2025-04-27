#include "hip/hip_runtime.h"
#include "includes.h"

#define INF 2147483647

extern "C" {

}

__global__ void init(int *tab, int len) {
    // Calculate the global thread index
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    // Use stride to allow each thread to process multiple elements
    int stride = blockDim.x * gridDim.x;
    for (; i < len; i += stride) {
        tab[i] = INF;
    }
}