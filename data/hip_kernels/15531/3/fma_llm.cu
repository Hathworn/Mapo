#include "hip/hip_runtime.h"
#include "includes.h"
/*
* G2S
* Copyright (C) 2018, Mathieu Gravey (gravey.mathieu@gmail.com) and UNIL (University of Lausanne)
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#define PARTIAL_FFT

#ifndef FFTW_PLAN_OPTION
//FFTW_PATIENT
#define FFTW_PLAN_OPTION FFTW_ESTIMATE
#endif

#define fillVectorized(name, begin, amount, value) std::fill(name+begin,name+begin+amount,value);

__global__ void fma(float* realSpace, const unsigned int size, const float alpha, const float delta) {
    // Use shared memory for improved performance when accessing frequently used values
    __shared__ float sharedAlpha;
    __shared__ float sharedDelta;
    if (threadIdx.x == 0) {
        sharedAlpha = alpha; 
        sharedDelta = delta;
    }
    __syncthreads();

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size) {
        // Avoid redundant memory access within the kernel execution
        float temp = realSpace[i];
        realSpace[i] = fmaf(temp, sharedAlpha, sharedDelta);
    }
}