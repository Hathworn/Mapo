#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zero_dm_outliers_kernel_one(unsigned short *d_input, int nchans, int nsamp)
{

    int t  = blockIdx.x * blockDim.x + threadIdx.x;
    int count = 0;
    int iters = 0;

    float stdev = 1000000.0f;
    float mean = MEAN;
    float mean_last = 0.0f;
    float sum = 0.0f;
    float sum_squares = 0.0f;
    float cutoff = (CUT * stdev);

    __shared__ float g_mean[1024];
    __shared__ float g_stdev[1024];

    // Loop until convergence or maximum iterations
    while(abs(mean - mean_last) > ACC) {
        sum = 0.0f;
        sum_squares = 0.0f;
        count = 0;

        // Coalesced global memory access
        for(int c = 0; c < nchans; c++) {
            float data = (float)d_input[t*nchans + c];
            if(data < (mean + cutoff) && data > (mean - cutoff) ) {
                sum += data;
                sum_squares += (data * data);
                count++;
            }
        }
        
        mean_last = mean;
        mean = (count > 0) ? (sum / (float)count) : mean;
        sum_squares = ((count > 0) ? (sum_squares / count) - (mean * mean) : 0.0f);
        stdev = sqrt(sum_squares);
        cutoff = (CUT * stdev);

        iters++;
        if(iters > ITER) break;
    }

    // If anomalies detected
    if(count == 0 || iters > ITER || mean == 0.0f || stdev == 0.0f) {
        for(int c = 0; c < nchans; c++) {
            d_input[t*nchans + c] = MEAN;
        }
        g_mean[threadIdx.x] = mean = MEAN;
        g_stdev[threadIdx.x] = stdev = 0.0f;
    } else {
        g_mean[threadIdx.x] = mean;
        g_stdev[threadIdx.x] = stdev;
    }

    __syncthreads();

    float mean_of_mean = 0.0f;
    float stdev_of_mean = 0.0f;
    float m_cutoff = 0.0f;

    sum_squares = 0.0f;

    // Calculate mean and stdev of means across block
    for(int i = 0; i < blockDim.x; i++) {
        mean_of_mean += g_mean[i];
        sum_squares += (g_mean[i] * g_mean[i]);
    }

    mean_of_mean /= blockDim.x;
    sum_squares = ((sum_squares / blockDim.x) - (mean_of_mean * mean_of_mean));
    stdev_of_mean = sqrt(sum_squares);

    m_cutoff = (3.0 * stdev_of_mean);

    float mean_of_stdev = 0.0f;
    float stdev_of_stdev = 0.0f;
    float s_cutoff = 0.0f;

    sum_squares = 0.0f;

    // Calculate mean and stdev of stdevs across block
    for(int i = 0; i < blockDim.x; i++) {
        mean_of_stdev += g_stdev[i];
        sum_squares += (g_stdev[i] * g_stdev[i]);
    }

    mean_of_stdev /= blockDim.x;
    sum_squares = ((sum_squares / blockDim.x) - (mean_of_stdev * mean_of_stdev));
    stdev_of_stdev = sqrt(sum_squares);

    s_cutoff = (3.0 * stdev_of_stdev);

    // Outlier detection and replacement
    for(int c = 0; c < nchans; c++) {
        if((g_mean[threadIdx.x] - mean_of_mean) > m_cutoff 
          || (g_mean[threadIdx.x] - mean_of_mean) < -m_cutoff 
          || (g_stdev[threadIdx.x] - mean_of_stdev) > s_cutoff 
          || (g_stdev[threadIdx.x] - mean_of_stdev) < -s_cutoff) {
            d_input[t*nchans + c] = MEAN;
        } else {
            float val = (float)d_input[t*nchans + c];
            if(val - mean < R_CUT * stdev && val - mean > -R_CUT * stdev) {
                d_input[t*nchans + c] = (unsigned short)(val - mean + MEAN);
            } else {
                d_input[t*nchans + c] = MEAN;
            }
        }
    }
}