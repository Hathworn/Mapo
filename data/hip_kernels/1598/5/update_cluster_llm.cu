#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_cluster(int *cluster, float *centroid, float *B_c, float *G_c, float *R_c, int size_image, int n_threads, int K, float *Bdata, float *Gdata, float *Rdata, float *nValue)
{
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int id = threadIdx.x;
    int k = blockIdx.x;

    int size_per_thread = size_image / n_threads;
    int start = id * size_per_thread;
    int end = start + size_per_thread;

    // Initialize data
    float count = 0;
    float B = 0;
    float G = 0;
    float R = 0;
    
    nValue[tid] = 0;
    Bdata[tid] = 0;
    Gdata[tid] = 0;
    Rdata[tid] = 0;

    // Ensure id is within bounds before proceeding
    if (id >= size_image) { return; }

    // Correct partition for the last thread
    if (id == n_threads - 1)
    {
        start = (n_threads - 1) * size_per_thread;
        end = size_image;
    }

    // Calculate local B, G, R sums and count
    for (int j = start; j < end; j++)
    {
        if (cluster[j] == k)
        {
            B += B_c[j];
            G += G_c[j];
            R += R_c[j];
            count += 1;
        }
    }

    // Store local sums and count
    nValue[tid] = count;
    Bdata[tid] = B;
    Gdata[tid] = G;
    Rdata[tid] = R;

    // Synchronize before reduction
    __syncthreads();

    // Intra-block reduction
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (id < s && (tid + s) < (k + 1) * n_threads)
        {
            nValue[tid] += nValue[tid + s];
            Bdata[tid] += Bdata[tid + s];
            Gdata[tid] += Gdata[tid + s];
            Rdata[tid] += Rdata[tid + s];
        }
        __syncthreads();
    }

    // Update global centroid from reduced data
    if (id == 0)
    {
        if (nValue[tid] != 0)
        {
            centroid[k * 3 + 0] = Bdata[tid] / nValue[tid];
            centroid[k * 3 + 1] = Gdata[tid] / nValue[tid];
            centroid[k * 3 + 2] = Rdata[tid] / nValue[tid];
        }
    }
}