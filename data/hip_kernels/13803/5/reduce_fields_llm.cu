#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce_fields(float *d_rho, float *d_Ex, float* d_Ey, float* d_Ez, float *d_Rrho, float* d_REx, float* d_REy, float* d_REz, int N)
{
    __shared__ float rho_array[gThreadsAll];
    __shared__ float Ex_array[gThreadsAll];
    __shared__ float Ey_array[gThreadsAll];
    __shared__ float Ez_array[gThreadsAll];

    int n = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Load data to shared memory only if the index is within range
    if (n < N) {
        rho_array[threadIdx.x] = d_rho[n];
        Ex_array[threadIdx.x] = d_Ex[n] * d_Ex[n];
        Ey_array[threadIdx.x] = d_Ey[n] * d_Ey[n];
        Ez_array[threadIdx.x] = d_Ez[n] * d_Ez[n];
    } else {
        rho_array[threadIdx.x] = 0.0f;
        Ex_array[threadIdx.x] = 0.0f;
        Ey_array[threadIdx.x] = 0.0f;
        Ez_array[threadIdx.x] = 0.0f;
    }
    __syncthreads();

    // Perform reduction in shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            rho_array[threadIdx.x] += rho_array[threadIdx.x + s];
            Ex_array[threadIdx.x] += Ex_array[threadIdx.x + s];
            Ey_array[threadIdx.x] += Ey_array[threadIdx.x + s];
            Ez_array[threadIdx.x] += Ez_array[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Write result of reduction for this block to global memory
    if (threadIdx.x == 0) {
        d_Rrho[blockIdx.x] = rho_array[0];
        d_REx[blockIdx.x] = Ex_array[0];
        d_REy[blockIdx.x] = Ey_array[0];
        d_REz[blockIdx.x] = Ez_array[0];
    }
}