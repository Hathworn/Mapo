#include "hip/hip_runtime.h"
#include "includes.h"

/*
Copyright 2014-2015 Dake Feng, Peri LLC, dakefeng@gmail.com

This file is part of TomograPeri.

TomograPeri is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

TomograPeri is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with TomograPeri.  If not, see <http://www.gnu.org/licenses/>.
*/

#define blockx 16
#define blocky 16

__global__ void _kernelpp_cuda(int num_projections, float mov, int num_pixels, int num_grid, int num_slices, float* dev_gridx, float* dev_gridy, float* dev_suma, float* dev_E, float* dev_data, float* dev_recon, float* dev_theta) {
    uint q = blockIdx.x * blockDim.x + threadIdx.x;
    uint m = blockIdx.y * blockDim.y + threadIdx.y;
    if ((m >= num_pixels) || (q >= num_projections)) return;

    const double PI = 3.141592653589793238462;
    bool quadrant = ((dev_theta[q] >= 0 && dev_theta[q] < PI/2) || (dev_theta[q] >= PI && dev_theta[q] < 3*PI/2));
    float sinq = sin(dev_theta[q]);
    float cosq = cos(dev_theta[q]);
    float xi = -1e6;
    float yi = -(num_pixels - 1) / 2.0f + m + mov;
    float srcx = xi * cosq - yi * sinq;
    float srcy = xi * sinq + yi * cosq;
    float detx = -xi * cosq - yi * sinq;
    float dety = -xi * sinq + yi * cosq;
    float slope = (srcy - dety) / (srcx - detx);
    float islope = 1.0f / slope;

    float coordx[MAX_NUM_GRID], coordy[MAX_NUM_GRID];
    for (int n = 0; n <= num_grid; n++) {
        coordx[n] = islope * (dev_gridy[n] - srcy) + srcx;
        coordy[n] = slope * (dev_gridx[n] - srcx) + srcy;
    }

    float ax[MAX_NUM_GRID], ay[MAX_NUM_GRID], bx[MAX_NUM_GRID], by[MAX_NUM_GRID];
    int alen = 0, blen = 0;
    for (int n = 0; n <= num_grid; n++) {
        if (coordx[n] > dev_gridx[0] && coordx[n] < dev_gridx[num_grid]) {
            ax[alen] = coordx[n];
            ay[alen] = dev_gridy[n];
            alen++;
        }
        if (coordy[n] > dev_gridy[0] && coordy[n] < dev_gridy[num_grid]) {
            bx[blen] = dev_gridx[n];
            by[blen] = coordy[n];
            blen++;
        }
    }

    float coorx[MAX_NUM_GRID*2], coory[MAX_NUM_GRID*2];
    int len = alen + blen, i = 0, j = 0, k = 0;
    if (quadrant) {
        while (i < alen && j < blen) {
            if (ax[i] < bx[j]) {
                coorx[k] = ax[i];
                coory[k] = ay[i];
                i++;
            } else {
                coorx[k] = bx[j];
                coory[k] = by[j];
                j++;
            }
            k++;
        }
        while (i < alen) {
            coorx[k] = ax[i];
            coory[k] = ay[i];
            i++;
            k++;
        }
        while (j < blen) {
            coorx[k] = bx[j];
            coory[k] = by[j];
            j++;
            k++;
        }
    } else {
        while (i < alen && j < blen) {
            if (ax[alen - 1 - i] < bx[j]) {
                coorx[k] = ax[alen - 1 - i];
                coory[k] = ay[alen - 1 - i];
                i++;
            } else {
                coorx[k] = bx[j];
                coory[k] = by[j];
                j++;
            }
            k++;
        }
        while (i < alen) {
            coorx[k] = ax[alen - 1 - i];
            coory[k] = ay[alen - 1 - i];
            i++;
            k++;
        }
        while (j < blen) {
            coorx[k] = bx[j];
            coory[k] = by[j];
            j++;
            k++;
        }
    }

    float leng[MAX_NUM_GRID*2];
    int indi[MAX_NUM_GRID*2];
    for (int n = 0; n < len - 1; n++) {
        float diffx = coorx[n + 1] - coorx[n];
        float diffy = coory[n + 1] - coory[n];
        leng[n] = sqrt(diffx * diffx + diffy * diffy);
        float midx = (coorx[n + 1] + coorx[n]) / 2.0f;
        float midy = (coory[n + 1] + coory[n]) / 2.0f;
        int indx = (int)(midx + num_grid / 2.0f) - ((midx + num_grid / 2.0f) >= (int)(midx + num_grid / 2.0f));
        int indy = (int)(midy + num_grid / 2.0f) - ((midy + num_grid / 2.0f) >= (int)(midy + num_grid / 2.0f));
        indi[n] = indx + indy * num_grid;
    }

    for (int n = 0; n < len - 1; n++) {
        atomicAdd(&(dev_suma[indi[n]]), leng[n]);
    }

    for (int k = 0; k < num_slices; k++) {
        int i = k * num_grid * num_grid;
        int io = m + k * num_pixels + q * num_slices * num_pixels;

        float simdata = 0.0f;
        for (int n = 0; n < len - 1; n++) {
            simdata += dev_recon[indi[n] + i] * leng[n];
        }
        float upd = dev_data[io] / simdata;
        for (int n = 0; n < len - 1; n++) {
            atomicAdd(&(dev_E[indi[n] + i]), -dev_recon[indi[n] + i] * upd * leng[n]);
        }
    }
}