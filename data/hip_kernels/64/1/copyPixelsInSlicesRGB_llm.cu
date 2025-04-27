#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyPixelsInSlicesRGB(float *ptrinput0, float *ptrkslices0, int dH, int dW, int kH, int kW, int size1, int size2, int isize1, int isize2, int nInputPlane, int padleft, int padright, int padup, int paddown, int inputstr0, int kslicesstr0, int batchsize)
{
    // Calculate pixel coordinates
    const int pixi = blockIdx.x;
    const int pixj = blockIdx.y * blockDim.y + threadIdx.y;
    const int tidx = threadIdx.x;
    const int batchindex = blockIdx.z * blockDim.z + threadIdx.z;

    if (batchindex >= batchsize || pixj >= isize2 + padleft + padright) return;

    // Shared memory for better performance in shared calculations
    __shared__ int shared_data[32 * 5]; // Optimized structure to hold all shared values
    int * _imin = shared_data + 32 * 0;
    int * _jmin = shared_data + 32 * 1;
    int * _imax = shared_data + 32 * 2;
    int * _jmax = shared_data + 32 * 3;
    int * _offsets = shared_data + 32 * 4;

    // Calculate bounds and offsets
    if (threadIdx.z == 0)
    {
        int imin = max((pixi - (kH - 1) + (dH - 1)) / dH, 0);
        int jmin = max((pixj - (kW - 1) + (dW - 1)) / dW, 0);
        int imax = min(pixi / dH, size1 - 1);
        int jmax = min(pixj / dW, size2 - 1);

        if (threadIdx.x == 0 && threadIdx.y == 0)
        {
            _imin[tidx] = imin;
            _imax[tidx] = imax;
        }
        if (threadIdx.x == 0)
        {
            _jmin[threadIdx.y] = jmin;
            _jmax[threadIdx.y] = jmax;
        }

        int inputoffset = inputstr0 * blockIdx.z * blockDim.z + ((pixi - padup) * isize2 + (pixj - padleft)) * nInputPlane;
        int ksliceoffset = kslicesstr0 * blockIdx.z * blockDim.z + ((imin * size2 + jmin) * kH * kW + (pixi - imin * dH) * kW + (pixj - jmin * dW)) * nInputPlane;

        _offsets[threadIdx.y * 3] = inputoffset;
        _offsets[threadIdx.y * 3 + 1] = ksliceoffset;
    }

    __syncthreads();

    // Extract values from shared memory
    int imin = _imin[tidx];
    int jmin = _jmin[threadIdx.y];
    int imax = _imax[tidx];
    int jmax = _jmax[threadIdx.y];
    int inputoffset = _offsets[threadIdx.y * 3];
    int ksliceoffset = _offsets[threadIdx.y * 3 + 1];

    // Update pointers
    ptrinput0 += inputoffset + inputstr0 * threadIdx.z;
    ptrkslices0 += ksliceoffset + kslicesstr0 * threadIdx.z;

    // Calculate strides and padding flag
    const int stridej = (kH * kW - dW) * nInputPlane;
    const int stridei = (size2 * kH - dH) * kW * nInputPlane - (jmax - jmin + 1) * stridej;
    bool zeropad = pixi < padup || pixi > isize1 - 1 + padup || pixj < padleft || pixj > isize2 - 1 + padleft;

    // Read pixel value
    float pixvalue = zeropad ? 0 : ptrinput0[tidx];

    // Write to memory with calculated strides
    for (int i = imin; i <= imax; i++) {
        for (int j = jmin; j <= jmax; j++) {
            ptrkslices0[tidx] = pixvalue;
            ptrkslices0 += stridej;
        }
        ptrkslices0 += stridei;
    }
}