#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void useNoTexture(float* pin, float* pout, int len)
{
    // Calculate linear index directly for read and write operations
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int idy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int idz = blockIdx.z * blockDim.z + threadIdx.z;
    unsigned int index = idx + c_size.x * (idy + idz * c_size.y);

    // Use shared memory for better memory access patterns
    extern __shared__ float shared_mem[];
    float* shared_a = shared_mem;
    float* shared_b = shared_mem + blockDim.x * blockDim.y * blockDim.z;
    float* shared_c = shared_mem + 2 * blockDim.x * blockDim.y * blockDim.z;

    shared_a[threadIdx.x + blockDim.x * (threadIdx.y + threadIdx.z * blockDim.y)] = pin[0 + len * index];
    shared_b[threadIdx.x + blockDim.x * (threadIdx.y + threadIdx.z * blockDim.y)] = pin[1 + len * index];
    shared_c[threadIdx.x + blockDim.x * (threadIdx.y + threadIdx.z * blockDim.y)] = pin[2 + len * index];
    __syncthreads();

    // Compute result using shared memory
    float a = shared_a[threadIdx.x + blockDim.x * (threadIdx.y + threadIdx.z * blockDim.y)];
    float b = shared_b[threadIdx.x + blockDim.x * (threadIdx.y + threadIdx.z * blockDim.y)];
    float c = shared_c[threadIdx.x + blockDim.x * (threadIdx.y + threadIdx.z * blockDim.y)];

    // Store the result back into global memory
    pout[index] = sqrtf(powf(a, 2) + powf(b, 2) + powf(c, 2));
}