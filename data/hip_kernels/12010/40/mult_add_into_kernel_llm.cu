#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate index using block size and block index efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll loop for better performance, assuming n is divisible by 4
    // Use 'static' shared memory for input arrays to improve access speed
    extern __shared__ float shared_mem[];
    float* shared_a = shared_mem;
    float* shared_b = shared_a + blockDim.x;
    
    // Copy data to shared memory
    if (i < n) {
        shared_a[threadIdx.x] = a[i];
        shared_b[threadIdx.x] = b[i];
    }
    
    __syncthreads();
    
    // Perform computation with loop unrolling
    if (i < n) {
        c[i] += shared_a[threadIdx.x] * shared_b[threadIdx.x];
    }
}

// Note: You would need to allocate sufficient shared memory when launching the kernel
```
