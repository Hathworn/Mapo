#include "hip/hip_runtime.h"
#include "includes.h"
// filename: vmult!.cu
// a simple CUDA kernel to element multiply two vectors C=alpha*A.*B

extern "C"   // ensure function name to be exactly "vmult!"
{
}

__global__ void logkernel(const int lengthA, const double *a, double *b)
{
    // Optimized kernel using shared memory and loop unrolling
    extern __shared__ double shared_a[];
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < lengthA)
    {
        shared_a[threadIdx.x] = a[i];
        __syncthreads(); // Ensure all threads have loaded to shared memory
        b[i] = log(shared_a[threadIdx.x]);
    }
}