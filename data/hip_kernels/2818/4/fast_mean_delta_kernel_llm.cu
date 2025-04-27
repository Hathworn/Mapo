```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta) {
    const int threads = 512;
    __shared__ float local[threads];

    // Calculate global index for current thread
    int global_id = blockIdx.x * spatial + threadIdx.x;
    local[threadIdx.x] = 0;

    // Use single loop with stride pattern for coalesced memory access
    for (int j = 0; j < batch; ++j) {
        for (int i = global_id; i < batch * spatial * filters; i += blockDim.x * gridDim.x) {
            local[threadIdx.x] += (i < batch * spatial * filters) ? delta[i] : 0;
        }
    }

    __syncthreads();

    // Reduction using a single thread
    if (threadIdx.x == 0) {
        float sum = 0;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        mean_delta[blockIdx.x] = sum * (-1.f / sqrtf(variance[blockIdx.x] + .00001f));
    }
}