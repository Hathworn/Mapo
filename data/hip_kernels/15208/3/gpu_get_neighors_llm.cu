#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_get_neighbors(int *neighbors, int n, int k) {
    // Calculate global thread index for linear access
    int m = blockIdx.x * blockDim.x + threadIdx.x;
    int l = blockIdx.y * blockDim.y + threadIdx.y;

    int counter_i = 0;
    if(m < n && l < n) {
        // Iterate over neighborhood of size k
        for (int i = m - (k / 2); i <= m + (k / 2); i++) {
            int counter_j = 0;
            for (int j = l - (k / 2); j <= l + (k / 2); j++) {
                int index = m * n * k * k + l * k * k + counter_i * k + counter_j;
                int index_i = (n + i) % n;
                int index_j = (n + j) % n;
                neighbors[index] = index_i * n + index_j;
                counter_j++;
            }
            counter_i++;
        }
    }
}