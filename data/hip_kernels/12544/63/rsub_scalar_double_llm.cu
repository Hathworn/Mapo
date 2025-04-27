#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void rsub_scalar_double(int n, int idx,double dx,double *dy,int incy,double *result) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread operates within array bounds
    if (i < n && i >= idx && i % incy == 0) {
        result[i] = dx - dy[i]; // Perform subtraction
    }
}