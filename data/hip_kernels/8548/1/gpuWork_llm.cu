#include "hip/hip_runtime.h"
#include "includes.h"

#define BLKX 32
#define BLKY 32

hipStream_t gstream;

__global__ void gpuWork(double *g, double *h, double *error, int M, int nbLines) {
    // Calculate global indices considering the halo region
    long idX = threadIdx.x + blockIdx.x * blockDim.x + 1;
    long idY = threadIdx.y + blockIdx.y * blockDim.y + 1;
    long tidX = threadIdx.x + blockIdx.x * blockDim.x;
    long tidY = threadIdx.y + blockIdx.y * blockDim.y;
    long xSize = M + 2;

    // Utilize shared memory for error calculation
    __shared__ double errors[BLKX * BLKY];

    // Initialize to zero
    errors[threadIdx.y * blockDim.x + threadIdx.x] = 0.0;

    // Check bounds
    if (tidX < M && tidY < nbLines) {
        // Calculate new value
        double temp = 0.25 * (h[(idY - 1) * xSize + idX] +
                              h[(idY + 1) * xSize + idX] +
                              h[(idY * xSize) + idX - 1] +
                              h[(idY * xSize) + idX + 1]);
        // Store the result and calculate error
        g[(idY * xSize) + idX] = temp;
        errors[threadIdx.y * blockDim.x + threadIdx.x] = fabs(temp - h[(idY * xSize) + idX]);
    }

    // Synchronize threads within the block
    __syncthreads();

    // Reduce errors within the block
    for (unsigned long s = (blockDim.x * blockDim.y) / 2; s > 0; s >>= 1) {
        if (threadIdx.y * blockDim.x + threadIdx.x < s) {
            errors[threadIdx.y * blockDim.x + threadIdx.x] = 
                fmax(errors[threadIdx.y * blockDim.x + threadIdx.x],
                     errors[threadIdx.y * blockDim.x + threadIdx.x + s]);
        }
        __syncthreads();
    }

    // Write maximum error per block to global memory
    if (threadIdx.y * blockDim.x + threadIdx.x == 0) {
        int id = blockIdx.y * gridDim.x + blockIdx.x;
        error[id] = errors[0];
    }
}