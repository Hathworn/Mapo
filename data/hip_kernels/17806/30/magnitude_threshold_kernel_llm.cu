#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void magnitude_threshold_kernel(float *grad_x, float *grad_y, float *grad_z, float gamma)
{
    // Use shared memory for the critical computations
    __shared__ float shared_grad_x[BLOCK_SIZE];
    __shared__ float shared_grad_y[BLOCK_SIZE];
    __shared__ float shared_grad_z[BLOCK_SIZE];

    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
        return;

    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Load data into shared memory
    shared_grad_x[threadIdx.x] = grad_x[id];
    shared_grad_y[threadIdx.x] = grad_y[id];
    shared_grad_z[threadIdx.x] = grad_z[id];

    __syncthreads(); // Ensure all threads have loaded their data

    float norm = sqrt(shared_grad_x[threadIdx.x] * shared_grad_x[threadIdx.x] + 
                      shared_grad_y[threadIdx.x] * shared_grad_y[threadIdx.x] + 
                      shared_grad_z[threadIdx.x] * shared_grad_z[threadIdx.x]);

    if (norm > gamma)
    {
        float ratio = gamma / norm;
        shared_grad_x[threadIdx.x] *= ratio;
        shared_grad_y[threadIdx.x] *= ratio;
        shared_grad_z[threadIdx.x] *= ratio;

        // Write data back to global memory
        grad_x[id] = shared_grad_x[threadIdx.x];
        grad_y[id] = shared_grad_y[threadIdx.x];
        grad_z[id] = shared_grad_z[threadIdx.x];
    }
}