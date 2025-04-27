#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TgvSolveEtaKernel(float alpha0, float alpha1, float* atensor, float *btensor, float* ctensor, float* etau, float* etav1, float* etav2, int width, int height, int stride)
{
    int iy = blockIdx.y * blockDim.y + threadIdx.y;    // current row
    int ix = blockIdx.x * blockDim.x + threadIdx.x;    // current column

    if ((iy < height) && (ix < width))
    {
        int pos = ix + iy * stride;
        
        // Use shared memory to minimize repeated global memory access
        __shared__ float shared_atensor[blockDim.x * blockDim.y];
        __shared__ float shared_btensor[blockDim.x * blockDim.y];
        __shared__ float shared_ctensor[blockDim.x * blockDim.y];

        int localIdx = threadIdx.y * blockDim.x + threadIdx.x;
        shared_atensor[localIdx] = atensor[pos];
        shared_btensor[localIdx] = btensor[pos];
        shared_ctensor[localIdx] = ctensor[pos];

        __syncthreads(); // Synchronize to ensure all threads have loaded values

        // Perform calculations using shared memory
        float a = shared_atensor[localIdx];
        float b = shared_btensor[localIdx];
        float c = shared_ctensor[localIdx];

        float alpha1Squared = alpha1 * alpha1;
        float a_c = a + c;
        float b_c = b + c;

        etau[pos] = (a * a + b * b + 2 * c * c + a_c * a_c + b_c * b_c) * alpha1Squared;
        etav1[pos] = alpha1Squared * (b * b + c * c) + 4 * alpha0 * alpha0;
        etav2[pos] = alpha1Squared * (a * a + c * c) + 4 * alpha0 * alpha0;
    }
}