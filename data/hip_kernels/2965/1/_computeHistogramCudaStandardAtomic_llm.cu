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

__global__ void _computeHistogramCudaStandardAtomic(const uint8_t *__restrict__ bytes, size_t length, HistType *__restrict__ histogram) {
    // Calculate unique index for each thread
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x;

    // Optimize by reducing the total number of atomic operations
    // each thread accumulates its results in a local accumulator first.
    HistType localHist[256] = {0};

    for (size_t i = idx; i < length; i += stride) {
        atomicAdd(&(localHist[bytes[i]]), 1u);
    }

    // Update global histogram with accumulated local results, avoiding overlap
    __shared__ HistType sharedHist[256];
    if (threadIdx.x < 256) {
        sharedHist[threadIdx.x] = 0;
    }
    __syncthreads();

    for (int i = threadIdx.x; i < 256; i += blockDim.x) {
        atomicAdd(&sharedHist[i], localHist[i]);
    }
    __syncthreads();

    if (threadIdx.x < 256) {
        atomicAdd(&(histogram[threadIdx.x]), sharedHist[threadIdx.x]);
    }
}