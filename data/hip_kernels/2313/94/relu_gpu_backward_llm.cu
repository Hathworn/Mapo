#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
// Utilize shared memory to improve access speed
__shared__ float shared_outgrad[blockDim.x];
__shared__ float shared_indata[blockDim.x];

int tid = blockIdx.x * blockDim.x + threadIdx.x;
int local_tid = threadIdx.x;

// Load data into shared memory
if (tid < N) {
    shared_outgrad[local_tid] = outgrad[tid];
    shared_indata[local_tid] = indata[tid];
}
__syncthreads();

// Compute operation using data from shared memory
if (tid < N) {
    ingrad[tid] = shared_indata[local_tid] > 0 ? shared_outgrad[local_tid] : 0;
}
}