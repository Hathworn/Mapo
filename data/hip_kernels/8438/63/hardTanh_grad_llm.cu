#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh_grad(float* in_x, float* in_d, float* out_d, float min_val, float max_val, int size, bool inplace) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Use shared memory to minimize global memory accesses
    extern __shared__ float shared_data[];

    for (int i = tid; i < size; i += stride) {
        float x_val = in_x[i]; // Load data into register
        float d_val = (inplace) ? in_d[i] : out_d[i]; // Select based on inplace

        if (inplace) {
            if (x_val < min_val || x_val > max_val) d_val = 0;
        } else {
            if (x_val >= min_val && x_val <= max_val) d_val += out_d[i];
        }
  
        if (inplace) {
            in_d[i] = d_val; // Store result back to global memory
        } else {
            shared_data[threadIdx.x] = d_val; // Use shared memory for intermediate computation
            __syncthreads(); // Sync to ensure all threads have written to shared memory
            out_d[i] = shared_data[threadIdx.x]; // Write shared memory result back to global memory
        }
    }
}