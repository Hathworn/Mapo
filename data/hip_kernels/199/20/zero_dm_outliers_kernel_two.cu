#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void zero_dm_outliers_kernel_two(unsigned short *d_input, int nchans, int nsamp)
{

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


int c = blockIdx.x * blockDim.x + threadIdx.x;

count = 0;
iters = 0;

stdev = 1000000.0f;
mean = MEAN;
mean_last = 0.0f;
cutoff = (CUT * stdev);

while(abs(mean - mean_last) > ACC) {
sum = 0.0f;
sum_squares = 0.0f;
count = 0;

for(int t = 0; t < nsamp; t++) {
float data=(float)d_input[t*nchans + c];
if(data < (mean + cutoff) && data > (mean - cutoff) ) {
sum+=data;
sum_squares+=(data*data);
count++;
}
}
mean_last = mean;
mean = (sum/(float)count);
sum_squares = ((sum_squares / count) - (mean * mean));
stdev = sqrt(sum_squares);
cutoff = (CUT * stdev);

iters++;
if(iters > ITER) break;
}

if(count == 0 || iters > ITER || mean == 0.0f || stdev == 0.0f) {
for(int t = 0; t < nsamp; t++) {
d_input[t*nchans + c] = MEAN;
}
g_mean[threadIdx.x] = mean = MEAN;
g_stdev[threadIdx.x] = stdev = 0.0f;
} else {
g_mean[threadIdx.x] = mean;
g_stdev[threadIdx.x] = stdev;
}

__syncthreads();

float 	mean_of_mean = 0.0f;
float 	stdev_of_mean = 0.0f;
float 	m_cutoff = 0.0f;

sum_squares = 0.0f;

for(int i = 0; i<blockDim.x; i++) {
mean_of_mean += g_mean[i];
sum_squares   += (g_mean[i]* g_mean[i]);
}

mean_of_mean /= blockDim.x;
sum_squares = ((sum_squares / blockDim.x) - (mean_of_mean * mean_of_mean));

stdev_of_mean = sqrt(sum_squares);

m_cutoff = (3.0*stdev_of_mean);

float 	mean_of_stdev = 0.0f;
float 	stdev_of_stdev = 0.0f;
float 	s_cutoff = 0.0f;

sum_squares = 0.0f;

for(int i = 0; i<blockDim.x; i++) {
mean_of_stdev += g_stdev[i];
sum_squares   += (g_stdev[i]* g_stdev[i]);
}

mean_of_stdev /= blockDim.x;
sum_squares = ((sum_squares / blockDim.x) - (mean_of_stdev * mean_of_stdev));

stdev_of_stdev = sqrt(sum_squares);

s_cutoff = (3.0*stdev_of_stdev);

if((g_mean[threadIdx.x] - mean_of_mean) > m_cutoff ||  (g_mean[threadIdx.x] - mean_of_mean) < -m_cutoff) {
for(int t = 0; t < nsamp; t++) {
d_input[t*nchans + c] = MEAN;
}
} else if((g_stdev[threadIdx.x] - mean_of_stdev) > s_cutoff ||  (g_stdev[threadIdx.x] - mean_of_stdev) < -s_cutoff) {
for(int t = 0; t < nsamp; t++) {
d_input[t*nchans + c] = MEAN;
}
} else {
for(int t = 0; t < nsamp; t++) {
if((d_input[t*nchans + c]-mean < R_CUT*stdev) && (d_input[t*nchans + c]-mean > - R_CUT*stdev)) {
d_input[t*nchans + c] = (unsigned short)((float)d_input[t*nchans + c]-(float)mean+MEAN);
} else {
d_input[t*nchans + c] = MEAN;
}
}
}
}