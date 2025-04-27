#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill(float4 *localbuf, float val, float4* ptr, int offset, int N) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use shared memory to minimize access latency
    __shared__ float4 shared_localbuf[BLOCK_SIZE];
    
    if (idx < N) {
        // Load data into shared memory from global memory
        shared_localbuf[threadIdx.x] = localbuf[idx];
        __syncthreads(); // Ensure all threads have loaded data
        
        float4 t = shared_localbuf[threadIdx.x];
        
        t.x += val;
        t.y += val;
        t.z += val;
        t.w += val;
        
        ptr[offset + idx] = t;
    }
}
```

Note: `BLOCK_SIZE` should be defined based on the configuration of block size used in the kernel launch.