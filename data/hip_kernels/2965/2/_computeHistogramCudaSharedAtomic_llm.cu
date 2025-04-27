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

__global__ void _computeHistogramCudaSharedAtomic(const uint8_t *__restrict__ bytes, size_t length, HistType *__restrict__ histogram) {
    __shared__ HistType temp[256];
    temp[threadIdx.x] = 0;
    __syncthreads(); // Initialize shared memory

    size_t stride = blockDim.x * gridDim.x;
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    for (; idx < length; idx += stride) {
        atomicAdd(&temp[bytes[idx]], 1u);
        // Accumulate local histogram
    }
    __syncthreads();

    atomicAdd(&histogram[threadIdx.x], temp[threadIdx.x]);
    // Merge block histograms into global histogram
}