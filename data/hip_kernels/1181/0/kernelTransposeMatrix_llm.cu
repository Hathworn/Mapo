#include "hip/hip_runtime.h"
#include "includes.h"

#define NUMBER_THREADS 32

float elapsed_time_ms;
int gpudev = 1;

char *dev_mat_in, *dev_mat_out;

// Optimized kernel for matrix transpose
__global__ void kernelTransposeMatrix(const char *mat_in, char *mat_out, unsigned int rows, unsigned int cols) {
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int idy = threadIdx.y + blockIdx.y * blockDim.y;

    // Check boundaries and utilize shared memory for optimized memory access
    if (idx < cols && idy < rows) {
        extern __shared__ char tile[];
        unsigned int index_in = idy * cols + idx;
        unsigned int trans_index = idx * rows + idy;

        tile[threadIdx.y * blockDim.x + threadIdx.x] = mat_in[index_in];

        __syncthreads();

        // Write out the transposed data
        mat_out[trans_index] = tile[threadIdx.y * blockDim.x + threadIdx.x];
    }
}