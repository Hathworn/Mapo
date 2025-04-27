#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMultiply(double *a, double *b, double *c, int cr, int cc, int ac, int bc){

    // Calculate global row (y) and column (x) index for the thread
    long x = blockIdx.x * blockDim.x + threadIdx.x;
    long y = blockIdx.y * blockDim.y + threadIdx.y;

    // Initialize sum
    double sum = 0;

    // Check if within matrix bounds
    if(x < cc && y < cr){
        
        // Use shared memory for common elements
        extern __shared__ double shared[];
        double *shared_a = shared;
        double *shared_b = shared + blockDim.y * ac;

        // Loop over all elements in the current row/column pair
        for(int k = 0; k < ac; k++){

            // Load data into shared memory
            shared_a[threadIdx.y * ac + k] = a[y * ac + k];
            shared_b[k * bc + threadIdx.x] = b[k * bc + x];
            __syncthreads();

            // Perform partial dot product
            sum += shared_a[threadIdx.y * ac + k] * shared_b[k * bc + threadIdx.x];
            __syncthreads();
        }
        
        // Write result back to global memory
        c[y * cc + x] = sum;
    }
}