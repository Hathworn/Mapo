#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_cluster(int *cluster, float *centroid, float *B_c, float *G_c, float *R_c, int size_image, int n_threads, int k, float *Bdata, float *Gdata, float *Rdata, float *nValue)
{
    unsigned int tid = threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x; // Calculate stride
    int start = tid;

    float count = 0;
    float B = 0;
    float G = 0;
    float R = 0;

    // Use stride to handle oversized datasets
    for (int j = start; j < size_image; j += stride)
    {
        if (cluster[j] == k)
        {
            B += B_c[j];
            G += G_c[j];
            R += R_c[j];
            count += 1;
        }
    }

    nValue[tid] = count;
    Bdata[tid] = B;
    Gdata[tid] = G;
    Rdata[tid] = R;

    __syncthreads();

    // Optimized parallel reduction
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            nValue[tid] += nValue[tid + s];
            Bdata[tid] += Bdata[tid + s];
            Gdata[tid] += Gdata[tid + s];
            Rdata[tid] += Rdata[tid + s];
        }
        __syncthreads();
    }

    if (tid == 0)
    {
        if (nValue[0] != 0)
        {
            centroid[k * 3 + 0] = Bdata[0] / nValue[0];
            centroid[k * 3 + 1] = Gdata[0] / nValue[0];
            centroid[k * 3 + 2] = Rdata[0] / nValue[0];
        }
    }
}