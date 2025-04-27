#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void reducePartial(int size, void *data, void *result) {
    float *fdata = (float*) data;
    float *sum = (float*) result;

    extern __shared__ double sdata[];
    // Utilize fewer shared memory allocations
    double* cdata = sdata + 2 * blockDim.x;

    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;
    
    // Load data to shared memory with bounds check reduction
    double temp1 = (i < size) ? fdata[i] : 0.0;
    double temp2 = (i + blockDim.x < size) ? fdata[i + blockDim.x] : 0.0;
    sdata[tid] = temp1 + temp2;
    cdata[tid] = sdata[tid] - temp1 - temp2;
    __syncthreads();

    // Perform parallel reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            double pe = sdata[tid];
            double qe = sdata[tid + s];
            double cs = cdata[tid];
            sdata[tid] = pe + qe - cs - cdata[tid + s];
            cdata[tid] = (sdata[tid] - pe) - qe;
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) sum[blockIdx.x] = sdata[0];
}