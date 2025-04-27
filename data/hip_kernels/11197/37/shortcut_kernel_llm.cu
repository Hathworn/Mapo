#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if thread ID is within size
    if (id >= size) return;
    
    // Precompute multipliers
    int minw_minh = minw * minh;
    int minw_minh_minc = minw_minh * minc;

    // Calculate indices
    int b = id / minw_minh_minc;
    int remain = id % minw_minh_minc;
    int k = remain / minw_minh;
    remain = remain % minw_minh;
    int j = remain / minw;
    int i = remain % minw;
    
    // Calculate indices for output and addition arrays
    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));
    
    // Perform addition
    out[out_index] += add[add_index];
}