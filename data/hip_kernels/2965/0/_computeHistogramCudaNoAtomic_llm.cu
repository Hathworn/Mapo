#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

using HistType = uint32_t;

enum class Mode {
    CPU,
    OMP,
    OMP_NOATOMIC,
    CUDA,
    CUDA_NOATOMIC,
    CUDA_SHARED,
};

enum class AtomicTypeCuda {
    NONE,
    STANDARD,
    SHARED,
};

// Optimized kernel function for computing histogram using HIP
__global__ void _computeHistogramCudaNoAtomic(const uint8_t *__restrict__ bytes, size_t length, HistType *__restrict__ histogram) {
    // Get global thread index
    size_t index = threadIdx.x + blockIdx.x * blockDim.x;
    // Calculate stride
    size_t stride = blockDim.x * gridDim.x;

    // Use shared memory to minimize global memory access
    __shared__ HistType shared_histogram[256];
    if (threadIdx.x < 256) {
        shared_histogram[threadIdx.x] = 0;
    }
    __syncthreads();

    // Accumulate histogram in shared memory
    for (size_t i = index; i < length; i += stride) {
        atomicAdd(&shared_histogram[bytes[i]], 1);
    }
    __syncthreads();

    // Write back shared memory histogram to global memory
    if (threadIdx.x < 256) {
        atomicAdd(&histogram[threadIdx.x], shared_histogram[threadIdx.x]);
    }
}