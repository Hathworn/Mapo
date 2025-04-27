```
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= n) return;

    extern __shared__ float shared_sum[];
    
    shared_sum[threadIdx.x] = 0;

    for(int b = 0; b < batch; ++b){
        int i = b * n + index;
        shared_sum[threadIdx.x] += delta[i];
    }

    __syncthreads();

    if(threadIdx.x == 0){
        float sum = 0;
        for(int i = 0; i < blockDim.x; ++i){
            sum += shared_sum[i];
        }
        atomicAdd(&bias_updates[index], sum);
    }
}