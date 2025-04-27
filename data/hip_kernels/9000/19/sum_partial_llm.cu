#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_partial(double4 *a, double4 *b, unsigned int nextsize) {

    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i >= nextsize) 
        return;

    extern __shared__ double4 shaccelerations[];
    double4 *shacc = (double4*) shaccelerations;

    // Load a[] into shared memory to allow coalesced global memory access
    shacc[threadIdx.x] = a[i];
    __syncthreads();  // Synchronize to ensure all threads have loaded their data

    double4 myacc = b[i];

    // Utilize shared memory - minimize repeated global memory accesses
    myacc.x += shacc[threadIdx.x].x;
    myacc.y += shacc[threadIdx.x].y;
    myacc.z += shacc[threadIdx.x].z;

    b[i] = myacc;
}