#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void sign_double(int n,int idx,double *dy,int incy,double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Unrolled loop to enhance performance
    for (; i < n; i += stride) {
        if(i >= idx && i % incy == 0) {
            double x = dy[i];
            result[i] = (x > 0) - (x < 0);
        }
    }
}