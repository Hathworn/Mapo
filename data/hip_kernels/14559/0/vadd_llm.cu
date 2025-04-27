#include "hip/hip_runtime.h"
#include "includes.h"

// a simple HIP kernel to add two vectors
extern "C"
{

} // extern "C"

// Optimized kernel: Utilize shared memory and check bounds
__global__ void vadd(const float *a, const float *b, float *c, int n)
{
    extern __shared__ float shared_mem[];
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (i < n) {
        shared_mem[threadIdx.x] = a[i] + b[i]; // Load into shared memory
        __syncthreads(); // Ensure all threads have completed writing to shared memory
        c[i] = shared_mem[threadIdx.x]; // Write back to global memory
    }
}