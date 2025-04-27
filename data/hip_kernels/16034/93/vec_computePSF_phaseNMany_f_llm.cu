#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_computePSF_phaseNMany_f(int n, int sizePart, int sizeTot, float *kx, float *ky, float *kz, float *pupil, float *phase, float *position, int *sparseIndexEvenDisk, int *sparseIndexOddDisk, float *fft, int many) {
    // Shared memory and register optimization
    extern __shared__ float shared_mem[];
    float *shared_position = shared_mem;
    
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + tid;
    
    // Load position into shared memory for efficiency
    if (tid < many * 3) {
        shared_position[tid] = position[tid];
    }
    __syncthreads();

    if (id < n) {
        int u = id / sizePart;
        int p = id % sizePart;
        
        // Compute x using shared memory
        float x = kx[p] * shared_position[u] + ky[p] * shared_position[u + many] + kz[p] * shared_position[u + 2 * many] + phase[p];
        
        // Use registers for intermediate computations
        float cos_x = cosf(x);
        float sin_x = sinf(x);
        
        // Write results to global memory
        fft[sparseIndexEvenDisk[p] + u * sizeTot] = pupil[p] * cos_x;
        fft[sparseIndexOddDisk[p] + u * sizeTot] = pupil[p] * sin_x;
    }
}