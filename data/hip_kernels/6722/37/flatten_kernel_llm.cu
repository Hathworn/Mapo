#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within bounds
    if (idx < N) {
        int b = idx / (layers * spatial);     // Batch index
        int i = idx % (layers * spatial);     // Remaining index after batch calculation
        int in_c = i / spatial;               // Layer index
        int in_s = i % spatial;               // Spatial index

        // Compute linear indices for input and output based on the forward flag
        int in_index = b * layers * spatial + in_c * spatial + in_s;
        int out_index = forward ? (b * layers * spatial + in_s * layers + in_c) 
                                : in_index;
        
        if (forward) {
            out[out_index] = x[in_index];    // Copy data in forward direction
        } else {
            out[in_index] = x[out_index];    // Copy data in backward direction
        }
    }
}