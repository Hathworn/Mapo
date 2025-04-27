#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Calculate batch and spatial indices
    int b = index / spatial;
    int i = index % spatial;

    // Allocate shared memory for sums
    __shared__ float shared_sum[1024]; 

    // Initialize sum
    float sum = 0;

    // Accumulate the squared values in shared memory
    for (int f = threadIdx.x; f < filters; f += blockDim.x) {
        int dataIndex = b * filters * spatial + f * spatial + i;
        sum += powf(x[dataIndex], 2);
    }

    // Perform reduction to find total sum in shared memory
    atomicAdd(&shared_sum[threadIdx.x], sum);

    __syncthreads(); // Synchronize threads

    // Get total sum for normalization
    if (threadIdx.x == 0) {
        sum = 0;
        for (int j = 0; j < blockDim.x; ++j) {
            sum += shared_sum[j];
        }
        sum = sqrtf(sum);
        if(sum == 0) sum = 1;
    }

    __syncthreads(); // Synchronize threads

    // Normalize the values
    for (int f = threadIdx.x; f < filters; f += blockDim.x) {
        int dataIndex = b * filters * spatial + f * spatial + i;
        x[dataIndex] /= sum;
        dx[dataIndex] = (1 - x[dataIndex]) / sum;
    }
}