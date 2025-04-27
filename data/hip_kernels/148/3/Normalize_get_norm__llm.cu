#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 128
#define GS(x) (((x) - 1) / TB + 1)

__global__ void Normalize_get_norm_(float *input, float *norm, int size1, int size23, int size023)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size023) {
        int dim23 = id % size23;
        int dim0 = id / size23;
        
        float sum = 0.0f;
        // Use float4 vectorization if possible for faster memory access
        for (int dim1 = 0; dim1 < size1; dim1++) {
            int index = (dim0 * size1 + dim1) * size23 + dim23;
            float4 data = reinterpret_cast<float4*>(input)[index >> 2];
            sum += data.x * data.x + data.y * data.y + data.z * data.z + data.w * data.w;
        }
        norm[dim0 * size23 + dim23] = sum + 1.3e-37f;
    }
}