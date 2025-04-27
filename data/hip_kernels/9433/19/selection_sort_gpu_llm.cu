#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, float *dist, int *idx, float *val) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    idx += m * k * batch_index;
    val += m * k * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    for (int j = index; j < m; j += stride) {
        float *p_dist = dist + j * n;
        // Use shared memory for current element set
        __shared__ float shared_dist[1024];
        int np = n;
        if (np > 1024) np = 1024; // Ensure shared memory size is not exceeded
        for (int i = threadIdx.x; i < np; i += blockDim.x) {
            shared_dist[i] = p_dist[i];
        }
        __syncthreads();

        // Selection sort for the first k elements using shared memory
        for (int s = 0; s < k; ++s) {
            int min = s;
            for (int t = s + 1; t < n; ++t) {
                if (shared_dist[t] < shared_dist[min]) {
                    min = t;
                }
            }
            idx[j * n + s] = min;
            val[j * n + s] = shared_dist[min];
            float tmp = shared_dist[min];
            shared_dist[min] = shared_dist[s];
            shared_dist[s] = tmp;
        }

        // Write back modified portion to global memory
        for (int i = threadIdx.x; i < np; i += blockDim.x) {
            p_dist[i] = shared_dist[i];
        }
    }
}