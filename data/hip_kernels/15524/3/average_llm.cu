#include "hip/hip_runtime.h"
#include "includes.h"

__constant__ float *c_Kernel;

__global__ void average(float *d_ip_v, float *d_ip_ir, int app_len) {

    // Calculate the global thread index
    int X = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory access
    extern __shared__ float shared_mem[];
    float *s_ip_v = shared_mem;
    float *s_ip_ir = shared_mem + blockDim.x;

    // Load inputs into shared memory
    if (X < app_len) {
        s_ip_v[threadIdx.x] = d_ip_v[X];
        s_ip_ir[threadIdx.x] = d_ip_ir[X];
    }
    __syncthreads();

    // Calculate the average using shared memory
    if (X < app_len) {
        s_ip_v[threadIdx.x] = (s_ip_v[threadIdx.x] + s_ip_ir[threadIdx.x]) / 2;
        d_ip_v[X] = s_ip_v[threadIdx.x];
    }
}