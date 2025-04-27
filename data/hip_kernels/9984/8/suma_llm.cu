#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int a, int b, int *c) {
    // Utilize shared memory to speed up computation
    __shared__ int temp; 
    
    // Ensure the operation is only performed by one thread
    if (threadIdx.x == 0) {
        temp = a + b;
    }
    
    // Use __syncthreads to ensure all threads have the result
    __syncthreads(); 
    
    if (threadIdx.x == 0) {
        *c = temp;
    }
}