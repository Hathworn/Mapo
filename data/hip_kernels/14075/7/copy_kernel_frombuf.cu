#include "hip/hip_runtime.h"
#include "includes.h"
/*
* Open source copyright declaration based on BSD open source template:
* http://www.opensource.org/licenses/bsd-license.php
*
* This file is part of the OPS distribution.
*
* Copyright (c) 2013, Mike Giles and others. Please see the AUTHORS file in
* the main source directory for a full list of copyright holders.
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
* * Redistributions of source code must retain the above copyright
* notice, this list of conditions and the following disclaimer.
* * Redistributions in binary form must reproduce the above copyright
* notice, this list of conditions and the following disclaimer in the
* documentation and/or other materials provided with the distribution.
* * The name of Mike Giles may not be used to endorse or promote products
* derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY Mike Giles ''AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL Mike Giles BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/** @file
* @brief OPS mpi+cuda run-time support routines
* @author Gihan Mudalige, Istvan Reguly
* @details Implements the runtime support routines for the OPS mpi+cuda
* backend
*/


int halo_buffer_size = 0;
char *halo_buffer_d = NULL;








__global__ void copy_kernel_frombuf(char *dest, char *src, int rx_s, int rx_e, int ry_s, int ry_e, int rz_s, int rz_e, int x_step, int y_step, int z_step, int size_x, int size_y, int size_z, int buf_strides_x, int buf_strides_y, int buf_strides_z, int type_size, int dim, int OPS_soa) {

int idx_z = rz_s + z_step * (blockDim.z * blockIdx.z + threadIdx.z);
int idx_y = ry_s + y_step * (blockDim.y * blockIdx.y + threadIdx.y);
int idx_x = rx_s + x_step * (blockDim.x * blockIdx.x + threadIdx.x);

if ((x_step == 1 ? idx_x < rx_e : idx_x > rx_e) &&
(y_step == 1 ? idx_y < ry_e : idx_y > ry_e) &&
(z_step == 1 ? idx_z < rz_e : idx_z > rz_e)) {

if (OPS_soa) dest += (idx_z * size_x * size_y + idx_y * size_x + idx_x) * type_size;
else dest += (idx_z * size_x * size_y + idx_y * size_x + idx_x) * type_size * dim;
src += ((idx_z - rz_s) * z_step * buf_strides_z +
(idx_y - ry_s) * y_step * buf_strides_y +
(idx_x - rx_s) * x_step * buf_strides_x) *
type_size * dim;
for (int d = 0; d < dim; d++) {
memcpy(dest, src + d * type_size, type_size);
if (OPS_soa) dest += size_x * size_y * size_z * type_size;
else dest += type_size;
}
}
}