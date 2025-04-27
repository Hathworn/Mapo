#include "hip/hip_runtime.h"
#include "includes.h"

__constant__ float *c_Kernel;

__global__ void compare(float *d_ip_v, float *d_ip_ir, int len) {
    // Calculate global thread index
    const int X = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize with loop unrolling for potential performance gain
    #pragma unroll
    for (int i = X; i < len; i += gridDim.x * blockDim.x) {
        d_ip_v[i] = (abs(d_ip_v[i]) > abs(d_ip_ir[i])) ? d_ip_v[i] : d_ip_ir[i];
    }
}