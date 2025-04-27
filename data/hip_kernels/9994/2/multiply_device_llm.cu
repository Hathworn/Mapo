#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiply_device (double *d_a, double *d_b, int dim) {
    
    // Utilize shared memory to improve data reuse
    __shared__ double shared_a[1024];  // Assuming maximum block size
    __shared__ double shared_b[1024];
    
    // Retrieve the thread and block specific information
    int i = threadIdx.x;
    int j, k;
    
    // Start Matrix Computation by processing row-wise with shared memory
    for (j = blockIdx.x * blockDim.x + threadIdx.x; j < dim; j += blockDim.x * gridDim.x) {
        double sum = 0.0;
        for (k = 0; k < dim; k++) {
            // Load data into shared memory
            shared_a[threadIdx.x] = d_a[k * dim + i];
            shared_b[threadIdx.x] = d_a[k * dim + j];
            __syncthreads();  // Ensure all threads have loaded the data

            // Reuse shared data if all multiple of blockDim.x
            sum += shared_a[threadIdx.x] * shared_b[threadIdx.x];
            __syncthreads();  // Ensure all threads have completed computation
        }
        d_b[i * dim + j] = sum;
    }
}