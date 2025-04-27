#include "hip/hip_runtime.h"
#include "includes.h"

/*
Copyright (c) 2015-2016 Advanced Micro Devices, Inc. All rights reserved.
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

#define LEN 1024
#define SIZE LEN * sizeof(float)
#define ITER 1024*1024

__global__ void Inc1(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure thread index is within bounds
    if(tx < 1) {
        float a_val = Ad[tx]; // Cache value of Ad[tx] to reduce global memory accesses

        for(int i = 0; i < ITER; i++) {
            a_val += 1.0f; // Increment cached value instead of accessing global memory

            // Copy updated value to Bd[tx]
            for(int j = 0; j < 256; j++) {
                Bd[tx] = a_val;
            }
        }

        // Update Ad[tx] with final increment result
        Ad[tx] = a_val;
    }
}