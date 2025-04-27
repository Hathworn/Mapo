#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_partial(double4 *a, double4 *b, unsigned int nextsize) {
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i >= nextsize) return;
    
    extern __shared__ double4 shaccelerations[];
    double4 myacc = b[i];
    
    // Load into shared memory: Threads in a warp can access efficiently
    shaccelerations[threadIdx.x] = a[i];
    __syncthreads(); // Ensure all threads have loaded their data into shared memory
    
    // Efficient use of shared memory data
    myacc.x += shaccelerations[threadIdx.x].x;
    myacc.y += shaccelerations[threadIdx.x].y;
    myacc.z += shaccelerations[threadIdx.x].z;
    
    b[i] = myacc;
}