; ModuleID = '../data/hip_kernels/4234/9/main.cu'
source_filename = "../data/hip_kernels/4234/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_ = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19kernel_256_one_1024PfS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = shl nuw nsw i32 %9, 8
  %11 = add nuw nsw i32 %10, %8
  %12 = shl nsw i32 %6, 10
  %13 = add nsw i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  %17 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %11
  store float %16, float addrspace(3)* %17, align 4, !tbaa !5
  %18 = shl nsw i32 %7, 8
  %19 = add i32 %18, %8
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %2, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 10240), i32 %8
  store float %22, float addrspace(3)* %23, align 4, !tbaa !5
  %24 = getelementptr inbounds float, float addrspace(1)* %3, i64 %20
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  %26 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 10496), i32 %8
  store float %25, float addrspace(3)* %26, align 4, !tbaa !5
  %27 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 9216), i32 %11
  store float 0.000000e+00, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %11
  %29 = add nuw nsw i32 %11, 1024
  %30 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %29
  %31 = add nuw nsw i32 %11, 2048
  %32 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %31
  %33 = add nuw nsw i32 %11, 3072
  %34 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %33
  %35 = add nuw nsw i32 %11, 4096
  %36 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %35
  %37 = add nuw nsw i32 %11, 5120
  %38 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %37
  %39 = add nuw nsw i32 %11, 6144
  %40 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %39
  %41 = add nuw nsw i32 %11, 7168
  %42 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %41
  %43 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %8
  %44 = add nuw nsw i32 %10, 1
  %45 = add nuw nsw i32 %8, 256
  %46 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %45
  %47 = add nuw nsw i32 %10, 2
  %48 = add nuw nsw i32 %8, 512
  %49 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %48
  %50 = add nuw nsw i32 %10, 3
  %51 = add nuw nsw i32 %8, 768
  %52 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %51
  %53 = add nuw nsw i32 %10, 4
  %54 = or i32 %8, 1024
  %55 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %54
  %56 = add nuw nsw i32 %10, 5
  %57 = add nuw nsw i32 %8, 1280
  %58 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %57
  %59 = add nuw nsw i32 %10, 6
  %60 = add nuw nsw i32 %8, 1536
  %61 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %60
  %62 = add nuw nsw i32 %10, 7
  %63 = add nuw nsw i32 %8, 1792
  %64 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %63
  %65 = add nuw nsw i32 %10, 8
  %66 = or i32 %8, 2048
  %67 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %66
  %68 = add nuw nsw i32 %10, 9
  %69 = add nuw nsw i32 %8, 2304
  %70 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %69
  %71 = add nuw nsw i32 %10, 10
  %72 = add nuw nsw i32 %8, 2560
  %73 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %72
  %74 = add nuw nsw i32 %10, 11
  %75 = add nuw nsw i32 %8, 2816
  %76 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %75
  %77 = add nuw nsw i32 %10, 12
  %78 = or i32 %8, 3072
  %79 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %78
  %80 = add nuw nsw i32 %10, 13
  %81 = add nuw nsw i32 %8, 3328
  %82 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %81
  %83 = add nuw nsw i32 %10, 14
  %84 = add nuw nsw i32 %8, 3584
  %85 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %84
  %86 = add nuw nsw i32 %10, 15
  %87 = add nuw nsw i32 %8, 3840
  %88 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %87
  %89 = add nuw nsw i32 %10, 16
  %90 = or i32 %8, 4096
  %91 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %90
  %92 = add nuw nsw i32 %10, 17
  %93 = add nuw nsw i32 %8, 4352
  %94 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %93
  %95 = add nuw nsw i32 %10, 18
  %96 = add nuw nsw i32 %8, 4608
  %97 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %96
  %98 = add nuw nsw i32 %10, 19
  %99 = add nuw nsw i32 %8, 4864
  %100 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %99
  %101 = add nuw nsw i32 %10, 20
  %102 = or i32 %8, 5120
  %103 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %102
  %104 = add nuw nsw i32 %10, 21
  %105 = add nuw nsw i32 %8, 5376
  %106 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %105
  %107 = add nuw nsw i32 %10, 22
  %108 = add nuw nsw i32 %8, 5632
  %109 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %108
  %110 = add nuw nsw i32 %10, 23
  %111 = add nuw nsw i32 %8, 5888
  %112 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %111
  %113 = add nuw nsw i32 %10, 24
  %114 = or i32 %8, 6144
  %115 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %114
  %116 = add nuw nsw i32 %10, 25
  %117 = add nuw nsw i32 %8, 6400
  %118 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %117
  %119 = add nuw nsw i32 %10, 26
  %120 = add nuw nsw i32 %8, 6656
  %121 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %120
  %122 = add nuw nsw i32 %10, 27
  %123 = add nuw nsw i32 %8, 6912
  %124 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %123
  %125 = add nuw nsw i32 %10, 28
  %126 = or i32 %8, 7168
  %127 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %126
  %128 = add nuw nsw i32 %10, 29
  %129 = add nuw nsw i32 %8, 7424
  %130 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %129
  %131 = add nuw nsw i32 %10, 30
  %132 = add nuw nsw i32 %8, 7680
  %133 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %132
  %134 = add nuw nsw i32 %10, 31
  %135 = add nuw nsw i32 %8, 7936
  %136 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 1024), i32 %135
  %137 = shl nuw nsw i32 %9, 10
  %138 = add i32 %19, %137
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %1, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %141, float addrspace(3)* %28, align 4, !tbaa !5
  %142 = add nuw nsw i32 %137, 4096
  %143 = add i32 %19, %142
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %146, float addrspace(3)* %30, align 4, !tbaa !5
  %147 = add nuw nsw i32 %137, 8192
  %148 = add i32 %19, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %151, float addrspace(3)* %32, align 4, !tbaa !5
  %152 = add nuw nsw i32 %137, 12288
  %153 = add i32 %19, %152
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %1, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %156, float addrspace(3)* %34, align 4, !tbaa !5
  %157 = add nuw nsw i32 %137, 16384
  %158 = add i32 %19, %157
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %161, float addrspace(3)* %36, align 4, !tbaa !5
  %162 = add nuw nsw i32 %137, 20480
  %163 = add i32 %19, %162
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %166, float addrspace(3)* %38, align 4, !tbaa !5
  %167 = add nuw nsw i32 %137, 24576
  %168 = add i32 %19, %167
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %1, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %171, float addrspace(3)* %40, align 4, !tbaa !5
  %172 = add nuw nsw i32 %137, 28672
  %173 = add i32 %19, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %1, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %176, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %177 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %10
  %178 = load float, float addrspace(3)* %177, align 4, !tbaa !5
  %179 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %180 = fmul contract float %178, %179
  %181 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %182 = fadd contract float %181, %180
  store float %182, float addrspace(3)* %27, align 4, !tbaa !5
  %183 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %44
  %184 = load float, float addrspace(3)* %183, align 4, !tbaa !5
  %185 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %186 = fmul contract float %184, %185
  %187 = fadd contract float %182, %186
  store float %187, float addrspace(3)* %27, align 4, !tbaa !5
  %188 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %47
  %189 = load float, float addrspace(3)* %188, align 4, !tbaa !5
  %190 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %191 = fmul contract float %189, %190
  %192 = fadd contract float %187, %191
  store float %192, float addrspace(3)* %27, align 4, !tbaa !5
  %193 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %50
  %194 = load float, float addrspace(3)* %193, align 4, !tbaa !5
  %195 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %196 = fmul contract float %194, %195
  %197 = fadd contract float %192, %196
  store float %197, float addrspace(3)* %27, align 4, !tbaa !5
  %198 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %53
  %199 = load float, float addrspace(3)* %198, align 4, !tbaa !5
  %200 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %201 = fmul contract float %199, %200
  %202 = fadd contract float %197, %201
  store float %202, float addrspace(3)* %27, align 4, !tbaa !5
  %203 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %56
  %204 = load float, float addrspace(3)* %203, align 4, !tbaa !5
  %205 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %206 = fmul contract float %204, %205
  %207 = fadd contract float %202, %206
  store float %207, float addrspace(3)* %27, align 4, !tbaa !5
  %208 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %59
  %209 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %210 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %211 = fmul contract float %209, %210
  %212 = fadd contract float %207, %211
  store float %212, float addrspace(3)* %27, align 4, !tbaa !5
  %213 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %62
  %214 = load float, float addrspace(3)* %213, align 4, !tbaa !5
  %215 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %216 = fmul contract float %214, %215
  %217 = fadd contract float %212, %216
  store float %217, float addrspace(3)* %27, align 4, !tbaa !5
  %218 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %65
  %219 = load float, float addrspace(3)* %218, align 4, !tbaa !5
  %220 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %221 = fmul contract float %219, %220
  %222 = fadd contract float %217, %221
  store float %222, float addrspace(3)* %27, align 4, !tbaa !5
  %223 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %68
  %224 = load float, float addrspace(3)* %223, align 4, !tbaa !5
  %225 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %226 = fmul contract float %224, %225
  %227 = fadd contract float %222, %226
  store float %227, float addrspace(3)* %27, align 4, !tbaa !5
  %228 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %71
  %229 = load float, float addrspace(3)* %228, align 4, !tbaa !5
  %230 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %231 = fmul contract float %229, %230
  %232 = fadd contract float %227, %231
  store float %232, float addrspace(3)* %27, align 4, !tbaa !5
  %233 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %74
  %234 = load float, float addrspace(3)* %233, align 4, !tbaa !5
  %235 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %236 = fmul contract float %234, %235
  %237 = fadd contract float %232, %236
  store float %237, float addrspace(3)* %27, align 4, !tbaa !5
  %238 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %77
  %239 = load float, float addrspace(3)* %238, align 4, !tbaa !5
  %240 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %241 = fmul contract float %239, %240
  %242 = fadd contract float %237, %241
  store float %242, float addrspace(3)* %27, align 4, !tbaa !5
  %243 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %80
  %244 = load float, float addrspace(3)* %243, align 4, !tbaa !5
  %245 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %246 = fmul contract float %244, %245
  %247 = fadd contract float %242, %246
  store float %247, float addrspace(3)* %27, align 4, !tbaa !5
  %248 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %83
  %249 = load float, float addrspace(3)* %248, align 4, !tbaa !5
  %250 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %251 = fmul contract float %249, %250
  %252 = fadd contract float %247, %251
  store float %252, float addrspace(3)* %27, align 4, !tbaa !5
  %253 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %86
  %254 = load float, float addrspace(3)* %253, align 4, !tbaa !5
  %255 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %256 = fmul contract float %254, %255
  %257 = fadd contract float %252, %256
  store float %257, float addrspace(3)* %27, align 4, !tbaa !5
  %258 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %89
  %259 = load float, float addrspace(3)* %258, align 4, !tbaa !5
  %260 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %261 = fmul contract float %259, %260
  %262 = fadd contract float %257, %261
  store float %262, float addrspace(3)* %27, align 4, !tbaa !5
  %263 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %92
  %264 = load float, float addrspace(3)* %263, align 4, !tbaa !5
  %265 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %266 = fmul contract float %264, %265
  %267 = fadd contract float %262, %266
  store float %267, float addrspace(3)* %27, align 4, !tbaa !5
  %268 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %95
  %269 = load float, float addrspace(3)* %268, align 4, !tbaa !5
  %270 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %271 = fmul contract float %269, %270
  %272 = fadd contract float %267, %271
  store float %272, float addrspace(3)* %27, align 4, !tbaa !5
  %273 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %98
  %274 = load float, float addrspace(3)* %273, align 4, !tbaa !5
  %275 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %276 = fmul contract float %274, %275
  %277 = fadd contract float %272, %276
  store float %277, float addrspace(3)* %27, align 4, !tbaa !5
  %278 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %101
  %279 = load float, float addrspace(3)* %278, align 4, !tbaa !5
  %280 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %281 = fmul contract float %279, %280
  %282 = fadd contract float %277, %281
  store float %282, float addrspace(3)* %27, align 4, !tbaa !5
  %283 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %104
  %284 = load float, float addrspace(3)* %283, align 4, !tbaa !5
  %285 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %286 = fmul contract float %284, %285
  %287 = fadd contract float %282, %286
  store float %287, float addrspace(3)* %27, align 4, !tbaa !5
  %288 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %107
  %289 = load float, float addrspace(3)* %288, align 4, !tbaa !5
  %290 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %291 = fmul contract float %289, %290
  %292 = fadd contract float %287, %291
  store float %292, float addrspace(3)* %27, align 4, !tbaa !5
  %293 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %110
  %294 = load float, float addrspace(3)* %293, align 4, !tbaa !5
  %295 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %296 = fmul contract float %294, %295
  %297 = fadd contract float %292, %296
  store float %297, float addrspace(3)* %27, align 4, !tbaa !5
  %298 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %113
  %299 = load float, float addrspace(3)* %298, align 4, !tbaa !5
  %300 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %301 = fmul contract float %299, %300
  %302 = fadd contract float %297, %301
  store float %302, float addrspace(3)* %27, align 4, !tbaa !5
  %303 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %116
  %304 = load float, float addrspace(3)* %303, align 4, !tbaa !5
  %305 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %306 = fmul contract float %304, %305
  %307 = fadd contract float %302, %306
  store float %307, float addrspace(3)* %27, align 4, !tbaa !5
  %308 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %119
  %309 = load float, float addrspace(3)* %308, align 4, !tbaa !5
  %310 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %311 = fmul contract float %309, %310
  %312 = fadd contract float %307, %311
  store float %312, float addrspace(3)* %27, align 4, !tbaa !5
  %313 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %122
  %314 = load float, float addrspace(3)* %313, align 4, !tbaa !5
  %315 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %316 = fmul contract float %314, %315
  %317 = fadd contract float %312, %316
  store float %317, float addrspace(3)* %27, align 4, !tbaa !5
  %318 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %125
  %319 = load float, float addrspace(3)* %318, align 4, !tbaa !5
  %320 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %321 = fmul contract float %319, %320
  %322 = fadd contract float %317, %321
  store float %322, float addrspace(3)* %27, align 4, !tbaa !5
  %323 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %128
  %324 = load float, float addrspace(3)* %323, align 4, !tbaa !5
  %325 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %326 = fmul contract float %324, %325
  %327 = fadd contract float %322, %326
  store float %327, float addrspace(3)* %27, align 4, !tbaa !5
  %328 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %131
  %329 = load float, float addrspace(3)* %328, align 4, !tbaa !5
  %330 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %331 = fmul contract float %329, %330
  %332 = fadd contract float %327, %331
  store float %332, float addrspace(3)* %27, align 4, !tbaa !5
  %333 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %134
  %334 = load float, float addrspace(3)* %333, align 4, !tbaa !5
  %335 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %336 = fmul contract float %334, %335
  %337 = fadd contract float %332, %336
  store float %337, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %338 = shl nuw nsw i32 %9, 10
  %339 = add nuw nsw i32 %338, 32768
  %340 = add i32 %19, %339
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds float, float addrspace(1)* %1, i64 %341
  %343 = load float, float addrspace(1)* %342, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %343, float addrspace(3)* %28, align 4, !tbaa !5
  %344 = add nuw nsw i32 %338, 36864
  %345 = add i32 %19, %344
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds float, float addrspace(1)* %1, i64 %346
  %348 = load float, float addrspace(1)* %347, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %348, float addrspace(3)* %30, align 4, !tbaa !5
  %349 = add nuw nsw i32 %338, 40960
  %350 = add i32 %19, %349
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds float, float addrspace(1)* %1, i64 %351
  %353 = load float, float addrspace(1)* %352, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %353, float addrspace(3)* %32, align 4, !tbaa !5
  %354 = add nuw nsw i32 %338, 45056
  %355 = add i32 %19, %354
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds float, float addrspace(1)* %1, i64 %356
  %358 = load float, float addrspace(1)* %357, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %358, float addrspace(3)* %34, align 4, !tbaa !5
  %359 = add nuw nsw i32 %338, 49152
  %360 = add i32 %19, %359
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds float, float addrspace(1)* %1, i64 %361
  %363 = load float, float addrspace(1)* %362, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %363, float addrspace(3)* %36, align 4, !tbaa !5
  %364 = add nuw nsw i32 %338, 53248
  %365 = add i32 %19, %364
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds float, float addrspace(1)* %1, i64 %366
  %368 = load float, float addrspace(1)* %367, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %368, float addrspace(3)* %38, align 4, !tbaa !5
  %369 = add nuw nsw i32 %338, 57344
  %370 = add i32 %19, %369
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds float, float addrspace(1)* %1, i64 %371
  %373 = load float, float addrspace(1)* %372, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %373, float addrspace(3)* %40, align 4, !tbaa !5
  %374 = add nuw nsw i32 %338, 61440
  %375 = add i32 %19, %374
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds float, float addrspace(1)* %1, i64 %376
  %378 = load float, float addrspace(1)* %377, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %378, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %379 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %10
  %380 = load float, float addrspace(3)* %379, align 4, !tbaa !5
  %381 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %382 = fmul contract float %380, %381
  %383 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %384 = fadd contract float %383, %382
  store float %384, float addrspace(3)* %27, align 4, !tbaa !5
  %385 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %44
  %386 = load float, float addrspace(3)* %385, align 4, !tbaa !5
  %387 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %388 = fmul contract float %386, %387
  %389 = fadd contract float %384, %388
  store float %389, float addrspace(3)* %27, align 4, !tbaa !5
  %390 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %47
  %391 = load float, float addrspace(3)* %390, align 4, !tbaa !5
  %392 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %393 = fmul contract float %391, %392
  %394 = fadd contract float %389, %393
  store float %394, float addrspace(3)* %27, align 4, !tbaa !5
  %395 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %50
  %396 = load float, float addrspace(3)* %395, align 4, !tbaa !5
  %397 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %398 = fmul contract float %396, %397
  %399 = fadd contract float %394, %398
  store float %399, float addrspace(3)* %27, align 4, !tbaa !5
  %400 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %53
  %401 = load float, float addrspace(3)* %400, align 4, !tbaa !5
  %402 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %403 = fmul contract float %401, %402
  %404 = fadd contract float %399, %403
  store float %404, float addrspace(3)* %27, align 4, !tbaa !5
  %405 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %56
  %406 = load float, float addrspace(3)* %405, align 4, !tbaa !5
  %407 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %408 = fmul contract float %406, %407
  %409 = fadd contract float %404, %408
  store float %409, float addrspace(3)* %27, align 4, !tbaa !5
  %410 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %59
  %411 = load float, float addrspace(3)* %410, align 4, !tbaa !5
  %412 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %413 = fmul contract float %411, %412
  %414 = fadd contract float %409, %413
  store float %414, float addrspace(3)* %27, align 4, !tbaa !5
  %415 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %62
  %416 = load float, float addrspace(3)* %415, align 4, !tbaa !5
  %417 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %418 = fmul contract float %416, %417
  %419 = fadd contract float %414, %418
  store float %419, float addrspace(3)* %27, align 4, !tbaa !5
  %420 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %65
  %421 = load float, float addrspace(3)* %420, align 4, !tbaa !5
  %422 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %423 = fmul contract float %421, %422
  %424 = fadd contract float %419, %423
  store float %424, float addrspace(3)* %27, align 4, !tbaa !5
  %425 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %68
  %426 = load float, float addrspace(3)* %425, align 4, !tbaa !5
  %427 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %428 = fmul contract float %426, %427
  %429 = fadd contract float %424, %428
  store float %429, float addrspace(3)* %27, align 4, !tbaa !5
  %430 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %71
  %431 = load float, float addrspace(3)* %430, align 4, !tbaa !5
  %432 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %433 = fmul contract float %431, %432
  %434 = fadd contract float %429, %433
  store float %434, float addrspace(3)* %27, align 4, !tbaa !5
  %435 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %74
  %436 = load float, float addrspace(3)* %435, align 4, !tbaa !5
  %437 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %438 = fmul contract float %436, %437
  %439 = fadd contract float %434, %438
  store float %439, float addrspace(3)* %27, align 4, !tbaa !5
  %440 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %77
  %441 = load float, float addrspace(3)* %440, align 4, !tbaa !5
  %442 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %443 = fmul contract float %441, %442
  %444 = fadd contract float %439, %443
  store float %444, float addrspace(3)* %27, align 4, !tbaa !5
  %445 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %80
  %446 = load float, float addrspace(3)* %445, align 4, !tbaa !5
  %447 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %448 = fmul contract float %446, %447
  %449 = fadd contract float %444, %448
  store float %449, float addrspace(3)* %27, align 4, !tbaa !5
  %450 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %83
  %451 = load float, float addrspace(3)* %450, align 4, !tbaa !5
  %452 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %453 = fmul contract float %451, %452
  %454 = fadd contract float %449, %453
  store float %454, float addrspace(3)* %27, align 4, !tbaa !5
  %455 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %86
  %456 = load float, float addrspace(3)* %455, align 4, !tbaa !5
  %457 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %458 = fmul contract float %456, %457
  %459 = fadd contract float %454, %458
  store float %459, float addrspace(3)* %27, align 4, !tbaa !5
  %460 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %89
  %461 = load float, float addrspace(3)* %460, align 4, !tbaa !5
  %462 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %463 = fmul contract float %461, %462
  %464 = fadd contract float %459, %463
  store float %464, float addrspace(3)* %27, align 4, !tbaa !5
  %465 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %92
  %466 = load float, float addrspace(3)* %465, align 4, !tbaa !5
  %467 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %468 = fmul contract float %466, %467
  %469 = fadd contract float %464, %468
  store float %469, float addrspace(3)* %27, align 4, !tbaa !5
  %470 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %95
  %471 = load float, float addrspace(3)* %470, align 4, !tbaa !5
  %472 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %473 = fmul contract float %471, %472
  %474 = fadd contract float %469, %473
  store float %474, float addrspace(3)* %27, align 4, !tbaa !5
  %475 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %98
  %476 = load float, float addrspace(3)* %475, align 4, !tbaa !5
  %477 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %478 = fmul contract float %476, %477
  %479 = fadd contract float %474, %478
  store float %479, float addrspace(3)* %27, align 4, !tbaa !5
  %480 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %101
  %481 = load float, float addrspace(3)* %480, align 4, !tbaa !5
  %482 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %483 = fmul contract float %481, %482
  %484 = fadd contract float %479, %483
  store float %484, float addrspace(3)* %27, align 4, !tbaa !5
  %485 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %104
  %486 = load float, float addrspace(3)* %485, align 4, !tbaa !5
  %487 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %488 = fmul contract float %486, %487
  %489 = fadd contract float %484, %488
  store float %489, float addrspace(3)* %27, align 4, !tbaa !5
  %490 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %107
  %491 = load float, float addrspace(3)* %490, align 4, !tbaa !5
  %492 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %493 = fmul contract float %491, %492
  %494 = fadd contract float %489, %493
  store float %494, float addrspace(3)* %27, align 4, !tbaa !5
  %495 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %110
  %496 = load float, float addrspace(3)* %495, align 4, !tbaa !5
  %497 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %498 = fmul contract float %496, %497
  %499 = fadd contract float %494, %498
  store float %499, float addrspace(3)* %27, align 4, !tbaa !5
  %500 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %113
  %501 = load float, float addrspace(3)* %500, align 4, !tbaa !5
  %502 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %503 = fmul contract float %501, %502
  %504 = fadd contract float %499, %503
  store float %504, float addrspace(3)* %27, align 4, !tbaa !5
  %505 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %116
  %506 = load float, float addrspace(3)* %505, align 4, !tbaa !5
  %507 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %508 = fmul contract float %506, %507
  %509 = fadd contract float %504, %508
  store float %509, float addrspace(3)* %27, align 4, !tbaa !5
  %510 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %119
  %511 = load float, float addrspace(3)* %510, align 4, !tbaa !5
  %512 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %513 = fmul contract float %511, %512
  %514 = fadd contract float %509, %513
  store float %514, float addrspace(3)* %27, align 4, !tbaa !5
  %515 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %122
  %516 = load float, float addrspace(3)* %515, align 4, !tbaa !5
  %517 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %518 = fmul contract float %516, %517
  %519 = fadd contract float %514, %518
  store float %519, float addrspace(3)* %27, align 4, !tbaa !5
  %520 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %125
  %521 = load float, float addrspace(3)* %520, align 4, !tbaa !5
  %522 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %523 = fmul contract float %521, %522
  %524 = fadd contract float %519, %523
  store float %524, float addrspace(3)* %27, align 4, !tbaa !5
  %525 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %128
  %526 = load float, float addrspace(3)* %525, align 4, !tbaa !5
  %527 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %528 = fmul contract float %526, %527
  %529 = fadd contract float %524, %528
  store float %529, float addrspace(3)* %27, align 4, !tbaa !5
  %530 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %131
  %531 = load float, float addrspace(3)* %530, align 4, !tbaa !5
  %532 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %533 = fmul contract float %531, %532
  %534 = fadd contract float %529, %533
  store float %534, float addrspace(3)* %27, align 4, !tbaa !5
  %535 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 32), i32 %134
  %536 = load float, float addrspace(3)* %535, align 4, !tbaa !5
  %537 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %538 = fmul contract float %536, %537
  %539 = fadd contract float %534, %538
  store float %539, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %540 = shl nuw nsw i32 %9, 10
  %541 = add nuw nsw i32 %540, 65536
  %542 = add i32 %19, %541
  %543 = sext i32 %542 to i64
  %544 = getelementptr inbounds float, float addrspace(1)* %1, i64 %543
  %545 = load float, float addrspace(1)* %544, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %545, float addrspace(3)* %28, align 4, !tbaa !5
  %546 = add nuw nsw i32 %540, 69632
  %547 = add i32 %19, %546
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds float, float addrspace(1)* %1, i64 %548
  %550 = load float, float addrspace(1)* %549, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %550, float addrspace(3)* %30, align 4, !tbaa !5
  %551 = add nuw nsw i32 %540, 73728
  %552 = add i32 %19, %551
  %553 = sext i32 %552 to i64
  %554 = getelementptr inbounds float, float addrspace(1)* %1, i64 %553
  %555 = load float, float addrspace(1)* %554, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %555, float addrspace(3)* %32, align 4, !tbaa !5
  %556 = add nuw nsw i32 %540, 77824
  %557 = add i32 %19, %556
  %558 = sext i32 %557 to i64
  %559 = getelementptr inbounds float, float addrspace(1)* %1, i64 %558
  %560 = load float, float addrspace(1)* %559, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %560, float addrspace(3)* %34, align 4, !tbaa !5
  %561 = add nuw nsw i32 %540, 81920
  %562 = add i32 %19, %561
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds float, float addrspace(1)* %1, i64 %563
  %565 = load float, float addrspace(1)* %564, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %565, float addrspace(3)* %36, align 4, !tbaa !5
  %566 = add nuw nsw i32 %540, 86016
  %567 = add i32 %19, %566
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds float, float addrspace(1)* %1, i64 %568
  %570 = load float, float addrspace(1)* %569, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %570, float addrspace(3)* %38, align 4, !tbaa !5
  %571 = add nuw nsw i32 %540, 90112
  %572 = add i32 %19, %571
  %573 = sext i32 %572 to i64
  %574 = getelementptr inbounds float, float addrspace(1)* %1, i64 %573
  %575 = load float, float addrspace(1)* %574, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %575, float addrspace(3)* %40, align 4, !tbaa !5
  %576 = add nuw nsw i32 %540, 94208
  %577 = add i32 %19, %576
  %578 = sext i32 %577 to i64
  %579 = getelementptr inbounds float, float addrspace(1)* %1, i64 %578
  %580 = load float, float addrspace(1)* %579, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %580, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %581 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %10
  %582 = load float, float addrspace(3)* %581, align 4, !tbaa !5
  %583 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %584 = fmul contract float %582, %583
  %585 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %586 = fadd contract float %585, %584
  store float %586, float addrspace(3)* %27, align 4, !tbaa !5
  %587 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %44
  %588 = load float, float addrspace(3)* %587, align 4, !tbaa !5
  %589 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %590 = fmul contract float %588, %589
  %591 = fadd contract float %586, %590
  store float %591, float addrspace(3)* %27, align 4, !tbaa !5
  %592 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %47
  %593 = load float, float addrspace(3)* %592, align 4, !tbaa !5
  %594 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %595 = fmul contract float %593, %594
  %596 = fadd contract float %591, %595
  store float %596, float addrspace(3)* %27, align 4, !tbaa !5
  %597 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %50
  %598 = load float, float addrspace(3)* %597, align 4, !tbaa !5
  %599 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %600 = fmul contract float %598, %599
  %601 = fadd contract float %596, %600
  store float %601, float addrspace(3)* %27, align 4, !tbaa !5
  %602 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %53
  %603 = load float, float addrspace(3)* %602, align 4, !tbaa !5
  %604 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %605 = fmul contract float %603, %604
  %606 = fadd contract float %601, %605
  store float %606, float addrspace(3)* %27, align 4, !tbaa !5
  %607 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %56
  %608 = load float, float addrspace(3)* %607, align 4, !tbaa !5
  %609 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %610 = fmul contract float %608, %609
  %611 = fadd contract float %606, %610
  store float %611, float addrspace(3)* %27, align 4, !tbaa !5
  %612 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %59
  %613 = load float, float addrspace(3)* %612, align 4, !tbaa !5
  %614 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %615 = fmul contract float %613, %614
  %616 = fadd contract float %611, %615
  store float %616, float addrspace(3)* %27, align 4, !tbaa !5
  %617 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %62
  %618 = load float, float addrspace(3)* %617, align 4, !tbaa !5
  %619 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %620 = fmul contract float %618, %619
  %621 = fadd contract float %616, %620
  store float %621, float addrspace(3)* %27, align 4, !tbaa !5
  %622 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %65
  %623 = load float, float addrspace(3)* %622, align 4, !tbaa !5
  %624 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %625 = fmul contract float %623, %624
  %626 = fadd contract float %621, %625
  store float %626, float addrspace(3)* %27, align 4, !tbaa !5
  %627 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %68
  %628 = load float, float addrspace(3)* %627, align 4, !tbaa !5
  %629 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %630 = fmul contract float %628, %629
  %631 = fadd contract float %626, %630
  store float %631, float addrspace(3)* %27, align 4, !tbaa !5
  %632 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %71
  %633 = load float, float addrspace(3)* %632, align 4, !tbaa !5
  %634 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %635 = fmul contract float %633, %634
  %636 = fadd contract float %631, %635
  store float %636, float addrspace(3)* %27, align 4, !tbaa !5
  %637 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %74
  %638 = load float, float addrspace(3)* %637, align 4, !tbaa !5
  %639 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %640 = fmul contract float %638, %639
  %641 = fadd contract float %636, %640
  store float %641, float addrspace(3)* %27, align 4, !tbaa !5
  %642 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %77
  %643 = load float, float addrspace(3)* %642, align 4, !tbaa !5
  %644 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %645 = fmul contract float %643, %644
  %646 = fadd contract float %641, %645
  store float %646, float addrspace(3)* %27, align 4, !tbaa !5
  %647 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %80
  %648 = load float, float addrspace(3)* %647, align 4, !tbaa !5
  %649 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %650 = fmul contract float %648, %649
  %651 = fadd contract float %646, %650
  store float %651, float addrspace(3)* %27, align 4, !tbaa !5
  %652 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %83
  %653 = load float, float addrspace(3)* %652, align 4, !tbaa !5
  %654 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %655 = fmul contract float %653, %654
  %656 = fadd contract float %651, %655
  store float %656, float addrspace(3)* %27, align 4, !tbaa !5
  %657 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %86
  %658 = load float, float addrspace(3)* %657, align 4, !tbaa !5
  %659 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %660 = fmul contract float %658, %659
  %661 = fadd contract float %656, %660
  store float %661, float addrspace(3)* %27, align 4, !tbaa !5
  %662 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %89
  %663 = load float, float addrspace(3)* %662, align 4, !tbaa !5
  %664 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %665 = fmul contract float %663, %664
  %666 = fadd contract float %661, %665
  store float %666, float addrspace(3)* %27, align 4, !tbaa !5
  %667 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %92
  %668 = load float, float addrspace(3)* %667, align 4, !tbaa !5
  %669 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %670 = fmul contract float %668, %669
  %671 = fadd contract float %666, %670
  store float %671, float addrspace(3)* %27, align 4, !tbaa !5
  %672 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %95
  %673 = load float, float addrspace(3)* %672, align 4, !tbaa !5
  %674 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %675 = fmul contract float %673, %674
  %676 = fadd contract float %671, %675
  store float %676, float addrspace(3)* %27, align 4, !tbaa !5
  %677 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %98
  %678 = load float, float addrspace(3)* %677, align 4, !tbaa !5
  %679 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %680 = fmul contract float %678, %679
  %681 = fadd contract float %676, %680
  store float %681, float addrspace(3)* %27, align 4, !tbaa !5
  %682 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %101
  %683 = load float, float addrspace(3)* %682, align 4, !tbaa !5
  %684 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %685 = fmul contract float %683, %684
  %686 = fadd contract float %681, %685
  store float %686, float addrspace(3)* %27, align 4, !tbaa !5
  %687 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %104
  %688 = load float, float addrspace(3)* %687, align 4, !tbaa !5
  %689 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %690 = fmul contract float %688, %689
  %691 = fadd contract float %686, %690
  store float %691, float addrspace(3)* %27, align 4, !tbaa !5
  %692 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %107
  %693 = load float, float addrspace(3)* %692, align 4, !tbaa !5
  %694 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %695 = fmul contract float %693, %694
  %696 = fadd contract float %691, %695
  store float %696, float addrspace(3)* %27, align 4, !tbaa !5
  %697 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %110
  %698 = load float, float addrspace(3)* %697, align 4, !tbaa !5
  %699 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %700 = fmul contract float %698, %699
  %701 = fadd contract float %696, %700
  store float %701, float addrspace(3)* %27, align 4, !tbaa !5
  %702 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %113
  %703 = load float, float addrspace(3)* %702, align 4, !tbaa !5
  %704 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %705 = fmul contract float %703, %704
  %706 = fadd contract float %701, %705
  store float %706, float addrspace(3)* %27, align 4, !tbaa !5
  %707 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %116
  %708 = load float, float addrspace(3)* %707, align 4, !tbaa !5
  %709 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %710 = fmul contract float %708, %709
  %711 = fadd contract float %706, %710
  store float %711, float addrspace(3)* %27, align 4, !tbaa !5
  %712 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %119
  %713 = load float, float addrspace(3)* %712, align 4, !tbaa !5
  %714 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %715 = fmul contract float %713, %714
  %716 = fadd contract float %711, %715
  store float %716, float addrspace(3)* %27, align 4, !tbaa !5
  %717 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %122
  %718 = load float, float addrspace(3)* %717, align 4, !tbaa !5
  %719 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %720 = fmul contract float %718, %719
  %721 = fadd contract float %716, %720
  store float %721, float addrspace(3)* %27, align 4, !tbaa !5
  %722 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %125
  %723 = load float, float addrspace(3)* %722, align 4, !tbaa !5
  %724 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %725 = fmul contract float %723, %724
  %726 = fadd contract float %721, %725
  store float %726, float addrspace(3)* %27, align 4, !tbaa !5
  %727 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %128
  %728 = load float, float addrspace(3)* %727, align 4, !tbaa !5
  %729 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %730 = fmul contract float %728, %729
  %731 = fadd contract float %726, %730
  store float %731, float addrspace(3)* %27, align 4, !tbaa !5
  %732 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %131
  %733 = load float, float addrspace(3)* %732, align 4, !tbaa !5
  %734 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %735 = fmul contract float %733, %734
  %736 = fadd contract float %731, %735
  store float %736, float addrspace(3)* %27, align 4, !tbaa !5
  %737 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 64), i32 %134
  %738 = load float, float addrspace(3)* %737, align 4, !tbaa !5
  %739 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %740 = fmul contract float %738, %739
  %741 = fadd contract float %736, %740
  store float %741, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %742 = shl nuw nsw i32 %9, 10
  %743 = add nuw nsw i32 %742, 98304
  %744 = add i32 %19, %743
  %745 = sext i32 %744 to i64
  %746 = getelementptr inbounds float, float addrspace(1)* %1, i64 %745
  %747 = load float, float addrspace(1)* %746, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %747, float addrspace(3)* %28, align 4, !tbaa !5
  %748 = add nuw nsw i32 %742, 102400
  %749 = add i32 %19, %748
  %750 = sext i32 %749 to i64
  %751 = getelementptr inbounds float, float addrspace(1)* %1, i64 %750
  %752 = load float, float addrspace(1)* %751, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %752, float addrspace(3)* %30, align 4, !tbaa !5
  %753 = add nuw nsw i32 %742, 106496
  %754 = add i32 %19, %753
  %755 = sext i32 %754 to i64
  %756 = getelementptr inbounds float, float addrspace(1)* %1, i64 %755
  %757 = load float, float addrspace(1)* %756, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %757, float addrspace(3)* %32, align 4, !tbaa !5
  %758 = add nuw nsw i32 %742, 110592
  %759 = add i32 %19, %758
  %760 = sext i32 %759 to i64
  %761 = getelementptr inbounds float, float addrspace(1)* %1, i64 %760
  %762 = load float, float addrspace(1)* %761, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %762, float addrspace(3)* %34, align 4, !tbaa !5
  %763 = add nuw nsw i32 %742, 114688
  %764 = add i32 %19, %763
  %765 = sext i32 %764 to i64
  %766 = getelementptr inbounds float, float addrspace(1)* %1, i64 %765
  %767 = load float, float addrspace(1)* %766, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %767, float addrspace(3)* %36, align 4, !tbaa !5
  %768 = add nuw nsw i32 %742, 118784
  %769 = add i32 %19, %768
  %770 = sext i32 %769 to i64
  %771 = getelementptr inbounds float, float addrspace(1)* %1, i64 %770
  %772 = load float, float addrspace(1)* %771, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %772, float addrspace(3)* %38, align 4, !tbaa !5
  %773 = add nuw nsw i32 %742, 122880
  %774 = add i32 %19, %773
  %775 = sext i32 %774 to i64
  %776 = getelementptr inbounds float, float addrspace(1)* %1, i64 %775
  %777 = load float, float addrspace(1)* %776, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %777, float addrspace(3)* %40, align 4, !tbaa !5
  %778 = add nuw nsw i32 %742, 126976
  %779 = add i32 %19, %778
  %780 = sext i32 %779 to i64
  %781 = getelementptr inbounds float, float addrspace(1)* %1, i64 %780
  %782 = load float, float addrspace(1)* %781, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %782, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %783 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %10
  %784 = load float, float addrspace(3)* %783, align 4, !tbaa !5
  %785 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %786 = fmul contract float %784, %785
  %787 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %788 = fadd contract float %787, %786
  store float %788, float addrspace(3)* %27, align 4, !tbaa !5
  %789 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %44
  %790 = load float, float addrspace(3)* %789, align 4, !tbaa !5
  %791 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %792 = fmul contract float %790, %791
  %793 = fadd contract float %788, %792
  store float %793, float addrspace(3)* %27, align 4, !tbaa !5
  %794 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %47
  %795 = load float, float addrspace(3)* %794, align 4, !tbaa !5
  %796 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %797 = fmul contract float %795, %796
  %798 = fadd contract float %793, %797
  store float %798, float addrspace(3)* %27, align 4, !tbaa !5
  %799 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %50
  %800 = load float, float addrspace(3)* %799, align 4, !tbaa !5
  %801 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %802 = fmul contract float %800, %801
  %803 = fadd contract float %798, %802
  store float %803, float addrspace(3)* %27, align 4, !tbaa !5
  %804 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %53
  %805 = load float, float addrspace(3)* %804, align 4, !tbaa !5
  %806 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %807 = fmul contract float %805, %806
  %808 = fadd contract float %803, %807
  store float %808, float addrspace(3)* %27, align 4, !tbaa !5
  %809 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %56
  %810 = load float, float addrspace(3)* %809, align 4, !tbaa !5
  %811 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %812 = fmul contract float %810, %811
  %813 = fadd contract float %808, %812
  store float %813, float addrspace(3)* %27, align 4, !tbaa !5
  %814 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %59
  %815 = load float, float addrspace(3)* %814, align 4, !tbaa !5
  %816 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %817 = fmul contract float %815, %816
  %818 = fadd contract float %813, %817
  store float %818, float addrspace(3)* %27, align 4, !tbaa !5
  %819 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %62
  %820 = load float, float addrspace(3)* %819, align 4, !tbaa !5
  %821 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %822 = fmul contract float %820, %821
  %823 = fadd contract float %818, %822
  store float %823, float addrspace(3)* %27, align 4, !tbaa !5
  %824 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %65
  %825 = load float, float addrspace(3)* %824, align 4, !tbaa !5
  %826 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %827 = fmul contract float %825, %826
  %828 = fadd contract float %823, %827
  store float %828, float addrspace(3)* %27, align 4, !tbaa !5
  %829 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %68
  %830 = load float, float addrspace(3)* %829, align 4, !tbaa !5
  %831 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %832 = fmul contract float %830, %831
  %833 = fadd contract float %828, %832
  store float %833, float addrspace(3)* %27, align 4, !tbaa !5
  %834 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %71
  %835 = load float, float addrspace(3)* %834, align 4, !tbaa !5
  %836 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %837 = fmul contract float %835, %836
  %838 = fadd contract float %833, %837
  store float %838, float addrspace(3)* %27, align 4, !tbaa !5
  %839 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %74
  %840 = load float, float addrspace(3)* %839, align 4, !tbaa !5
  %841 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %842 = fmul contract float %840, %841
  %843 = fadd contract float %838, %842
  store float %843, float addrspace(3)* %27, align 4, !tbaa !5
  %844 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %77
  %845 = load float, float addrspace(3)* %844, align 4, !tbaa !5
  %846 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %847 = fmul contract float %845, %846
  %848 = fadd contract float %843, %847
  store float %848, float addrspace(3)* %27, align 4, !tbaa !5
  %849 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %80
  %850 = load float, float addrspace(3)* %849, align 4, !tbaa !5
  %851 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %852 = fmul contract float %850, %851
  %853 = fadd contract float %848, %852
  store float %853, float addrspace(3)* %27, align 4, !tbaa !5
  %854 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %83
  %855 = load float, float addrspace(3)* %854, align 4, !tbaa !5
  %856 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %857 = fmul contract float %855, %856
  %858 = fadd contract float %853, %857
  store float %858, float addrspace(3)* %27, align 4, !tbaa !5
  %859 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %86
  %860 = load float, float addrspace(3)* %859, align 4, !tbaa !5
  %861 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %862 = fmul contract float %860, %861
  %863 = fadd contract float %858, %862
  store float %863, float addrspace(3)* %27, align 4, !tbaa !5
  %864 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %89
  %865 = load float, float addrspace(3)* %864, align 4, !tbaa !5
  %866 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %867 = fmul contract float %865, %866
  %868 = fadd contract float %863, %867
  store float %868, float addrspace(3)* %27, align 4, !tbaa !5
  %869 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %92
  %870 = load float, float addrspace(3)* %869, align 4, !tbaa !5
  %871 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %872 = fmul contract float %870, %871
  %873 = fadd contract float %868, %872
  store float %873, float addrspace(3)* %27, align 4, !tbaa !5
  %874 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %95
  %875 = load float, float addrspace(3)* %874, align 4, !tbaa !5
  %876 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %877 = fmul contract float %875, %876
  %878 = fadd contract float %873, %877
  store float %878, float addrspace(3)* %27, align 4, !tbaa !5
  %879 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %98
  %880 = load float, float addrspace(3)* %879, align 4, !tbaa !5
  %881 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %882 = fmul contract float %880, %881
  %883 = fadd contract float %878, %882
  store float %883, float addrspace(3)* %27, align 4, !tbaa !5
  %884 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %101
  %885 = load float, float addrspace(3)* %884, align 4, !tbaa !5
  %886 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %887 = fmul contract float %885, %886
  %888 = fadd contract float %883, %887
  store float %888, float addrspace(3)* %27, align 4, !tbaa !5
  %889 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %104
  %890 = load float, float addrspace(3)* %889, align 4, !tbaa !5
  %891 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %892 = fmul contract float %890, %891
  %893 = fadd contract float %888, %892
  store float %893, float addrspace(3)* %27, align 4, !tbaa !5
  %894 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %107
  %895 = load float, float addrspace(3)* %894, align 4, !tbaa !5
  %896 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %897 = fmul contract float %895, %896
  %898 = fadd contract float %893, %897
  store float %898, float addrspace(3)* %27, align 4, !tbaa !5
  %899 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %110
  %900 = load float, float addrspace(3)* %899, align 4, !tbaa !5
  %901 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %902 = fmul contract float %900, %901
  %903 = fadd contract float %898, %902
  store float %903, float addrspace(3)* %27, align 4, !tbaa !5
  %904 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %113
  %905 = load float, float addrspace(3)* %904, align 4, !tbaa !5
  %906 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %907 = fmul contract float %905, %906
  %908 = fadd contract float %903, %907
  store float %908, float addrspace(3)* %27, align 4, !tbaa !5
  %909 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %116
  %910 = load float, float addrspace(3)* %909, align 4, !tbaa !5
  %911 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %912 = fmul contract float %910, %911
  %913 = fadd contract float %908, %912
  store float %913, float addrspace(3)* %27, align 4, !tbaa !5
  %914 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %119
  %915 = load float, float addrspace(3)* %914, align 4, !tbaa !5
  %916 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %917 = fmul contract float %915, %916
  %918 = fadd contract float %913, %917
  store float %918, float addrspace(3)* %27, align 4, !tbaa !5
  %919 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %122
  %920 = load float, float addrspace(3)* %919, align 4, !tbaa !5
  %921 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %922 = fmul contract float %920, %921
  %923 = fadd contract float %918, %922
  store float %923, float addrspace(3)* %27, align 4, !tbaa !5
  %924 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %125
  %925 = load float, float addrspace(3)* %924, align 4, !tbaa !5
  %926 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %927 = fmul contract float %925, %926
  %928 = fadd contract float %923, %927
  store float %928, float addrspace(3)* %27, align 4, !tbaa !5
  %929 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %128
  %930 = load float, float addrspace(3)* %929, align 4, !tbaa !5
  %931 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %932 = fmul contract float %930, %931
  %933 = fadd contract float %928, %932
  store float %933, float addrspace(3)* %27, align 4, !tbaa !5
  %934 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %131
  %935 = load float, float addrspace(3)* %934, align 4, !tbaa !5
  %936 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %937 = fmul contract float %935, %936
  %938 = fadd contract float %933, %937
  store float %938, float addrspace(3)* %27, align 4, !tbaa !5
  %939 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 96), i32 %134
  %940 = load float, float addrspace(3)* %939, align 4, !tbaa !5
  %941 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %942 = fmul contract float %940, %941
  %943 = fadd contract float %938, %942
  store float %943, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %944 = shl nuw nsw i32 %9, 10
  %945 = add nuw nsw i32 %944, 131072
  %946 = add i32 %19, %945
  %947 = sext i32 %946 to i64
  %948 = getelementptr inbounds float, float addrspace(1)* %1, i64 %947
  %949 = load float, float addrspace(1)* %948, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %949, float addrspace(3)* %28, align 4, !tbaa !5
  %950 = add nuw nsw i32 %944, 135168
  %951 = add i32 %19, %950
  %952 = sext i32 %951 to i64
  %953 = getelementptr inbounds float, float addrspace(1)* %1, i64 %952
  %954 = load float, float addrspace(1)* %953, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %954, float addrspace(3)* %30, align 4, !tbaa !5
  %955 = add nuw nsw i32 %944, 139264
  %956 = add i32 %19, %955
  %957 = sext i32 %956 to i64
  %958 = getelementptr inbounds float, float addrspace(1)* %1, i64 %957
  %959 = load float, float addrspace(1)* %958, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %959, float addrspace(3)* %32, align 4, !tbaa !5
  %960 = add nuw nsw i32 %944, 143360
  %961 = add i32 %19, %960
  %962 = sext i32 %961 to i64
  %963 = getelementptr inbounds float, float addrspace(1)* %1, i64 %962
  %964 = load float, float addrspace(1)* %963, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %964, float addrspace(3)* %34, align 4, !tbaa !5
  %965 = add nuw nsw i32 %944, 147456
  %966 = add i32 %19, %965
  %967 = sext i32 %966 to i64
  %968 = getelementptr inbounds float, float addrspace(1)* %1, i64 %967
  %969 = load float, float addrspace(1)* %968, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %969, float addrspace(3)* %36, align 4, !tbaa !5
  %970 = add nuw nsw i32 %944, 151552
  %971 = add i32 %19, %970
  %972 = sext i32 %971 to i64
  %973 = getelementptr inbounds float, float addrspace(1)* %1, i64 %972
  %974 = load float, float addrspace(1)* %973, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %974, float addrspace(3)* %38, align 4, !tbaa !5
  %975 = add nuw nsw i32 %944, 155648
  %976 = add i32 %19, %975
  %977 = sext i32 %976 to i64
  %978 = getelementptr inbounds float, float addrspace(1)* %1, i64 %977
  %979 = load float, float addrspace(1)* %978, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %979, float addrspace(3)* %40, align 4, !tbaa !5
  %980 = add nuw nsw i32 %944, 159744
  %981 = add i32 %19, %980
  %982 = sext i32 %981 to i64
  %983 = getelementptr inbounds float, float addrspace(1)* %1, i64 %982
  %984 = load float, float addrspace(1)* %983, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %984, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %985 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %10
  %986 = load float, float addrspace(3)* %985, align 4, !tbaa !5
  %987 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %988 = fmul contract float %986, %987
  %989 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %990 = fadd contract float %989, %988
  store float %990, float addrspace(3)* %27, align 4, !tbaa !5
  %991 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %44
  %992 = load float, float addrspace(3)* %991, align 4, !tbaa !5
  %993 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %994 = fmul contract float %992, %993
  %995 = fadd contract float %990, %994
  store float %995, float addrspace(3)* %27, align 4, !tbaa !5
  %996 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %47
  %997 = load float, float addrspace(3)* %996, align 4, !tbaa !5
  %998 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %999 = fmul contract float %997, %998
  %1000 = fadd contract float %995, %999
  store float %1000, float addrspace(3)* %27, align 4, !tbaa !5
  %1001 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %50
  %1002 = load float, float addrspace(3)* %1001, align 4, !tbaa !5
  %1003 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %1004 = fmul contract float %1002, %1003
  %1005 = fadd contract float %1000, %1004
  store float %1005, float addrspace(3)* %27, align 4, !tbaa !5
  %1006 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %53
  %1007 = load float, float addrspace(3)* %1006, align 4, !tbaa !5
  %1008 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %1009 = fmul contract float %1007, %1008
  %1010 = fadd contract float %1005, %1009
  store float %1010, float addrspace(3)* %27, align 4, !tbaa !5
  %1011 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %56
  %1012 = load float, float addrspace(3)* %1011, align 4, !tbaa !5
  %1013 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %1014 = fmul contract float %1012, %1013
  %1015 = fadd contract float %1010, %1014
  store float %1015, float addrspace(3)* %27, align 4, !tbaa !5
  %1016 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %59
  %1017 = load float, float addrspace(3)* %1016, align 4, !tbaa !5
  %1018 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %1019 = fmul contract float %1017, %1018
  %1020 = fadd contract float %1015, %1019
  store float %1020, float addrspace(3)* %27, align 4, !tbaa !5
  %1021 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %62
  %1022 = load float, float addrspace(3)* %1021, align 4, !tbaa !5
  %1023 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %1024 = fmul contract float %1022, %1023
  %1025 = fadd contract float %1020, %1024
  store float %1025, float addrspace(3)* %27, align 4, !tbaa !5
  %1026 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %65
  %1027 = load float, float addrspace(3)* %1026, align 4, !tbaa !5
  %1028 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %1029 = fmul contract float %1027, %1028
  %1030 = fadd contract float %1025, %1029
  store float %1030, float addrspace(3)* %27, align 4, !tbaa !5
  %1031 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %68
  %1032 = load float, float addrspace(3)* %1031, align 4, !tbaa !5
  %1033 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %1034 = fmul contract float %1032, %1033
  %1035 = fadd contract float %1030, %1034
  store float %1035, float addrspace(3)* %27, align 4, !tbaa !5
  %1036 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %71
  %1037 = load float, float addrspace(3)* %1036, align 4, !tbaa !5
  %1038 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %1039 = fmul contract float %1037, %1038
  %1040 = fadd contract float %1035, %1039
  store float %1040, float addrspace(3)* %27, align 4, !tbaa !5
  %1041 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %74
  %1042 = load float, float addrspace(3)* %1041, align 4, !tbaa !5
  %1043 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %1044 = fmul contract float %1042, %1043
  %1045 = fadd contract float %1040, %1044
  store float %1045, float addrspace(3)* %27, align 4, !tbaa !5
  %1046 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %77
  %1047 = load float, float addrspace(3)* %1046, align 4, !tbaa !5
  %1048 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %1049 = fmul contract float %1047, %1048
  %1050 = fadd contract float %1045, %1049
  store float %1050, float addrspace(3)* %27, align 4, !tbaa !5
  %1051 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %80
  %1052 = load float, float addrspace(3)* %1051, align 4, !tbaa !5
  %1053 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %1054 = fmul contract float %1052, %1053
  %1055 = fadd contract float %1050, %1054
  store float %1055, float addrspace(3)* %27, align 4, !tbaa !5
  %1056 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %83
  %1057 = load float, float addrspace(3)* %1056, align 4, !tbaa !5
  %1058 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %1059 = fmul contract float %1057, %1058
  %1060 = fadd contract float %1055, %1059
  store float %1060, float addrspace(3)* %27, align 4, !tbaa !5
  %1061 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %86
  %1062 = load float, float addrspace(3)* %1061, align 4, !tbaa !5
  %1063 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %1064 = fmul contract float %1062, %1063
  %1065 = fadd contract float %1060, %1064
  store float %1065, float addrspace(3)* %27, align 4, !tbaa !5
  %1066 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %89
  %1067 = load float, float addrspace(3)* %1066, align 4, !tbaa !5
  %1068 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %1069 = fmul contract float %1067, %1068
  %1070 = fadd contract float %1065, %1069
  store float %1070, float addrspace(3)* %27, align 4, !tbaa !5
  %1071 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %92
  %1072 = load float, float addrspace(3)* %1071, align 4, !tbaa !5
  %1073 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %1074 = fmul contract float %1072, %1073
  %1075 = fadd contract float %1070, %1074
  store float %1075, float addrspace(3)* %27, align 4, !tbaa !5
  %1076 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %95
  %1077 = load float, float addrspace(3)* %1076, align 4, !tbaa !5
  %1078 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %1079 = fmul contract float %1077, %1078
  %1080 = fadd contract float %1075, %1079
  store float %1080, float addrspace(3)* %27, align 4, !tbaa !5
  %1081 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %98
  %1082 = load float, float addrspace(3)* %1081, align 4, !tbaa !5
  %1083 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %1084 = fmul contract float %1082, %1083
  %1085 = fadd contract float %1080, %1084
  store float %1085, float addrspace(3)* %27, align 4, !tbaa !5
  %1086 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %101
  %1087 = load float, float addrspace(3)* %1086, align 4, !tbaa !5
  %1088 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %1089 = fmul contract float %1087, %1088
  %1090 = fadd contract float %1085, %1089
  store float %1090, float addrspace(3)* %27, align 4, !tbaa !5
  %1091 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %104
  %1092 = load float, float addrspace(3)* %1091, align 4, !tbaa !5
  %1093 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %1094 = fmul contract float %1092, %1093
  %1095 = fadd contract float %1090, %1094
  store float %1095, float addrspace(3)* %27, align 4, !tbaa !5
  %1096 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %107
  %1097 = load float, float addrspace(3)* %1096, align 4, !tbaa !5
  %1098 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %1099 = fmul contract float %1097, %1098
  %1100 = fadd contract float %1095, %1099
  store float %1100, float addrspace(3)* %27, align 4, !tbaa !5
  %1101 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %110
  %1102 = load float, float addrspace(3)* %1101, align 4, !tbaa !5
  %1103 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %1104 = fmul contract float %1102, %1103
  %1105 = fadd contract float %1100, %1104
  store float %1105, float addrspace(3)* %27, align 4, !tbaa !5
  %1106 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %113
  %1107 = load float, float addrspace(3)* %1106, align 4, !tbaa !5
  %1108 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %1109 = fmul contract float %1107, %1108
  %1110 = fadd contract float %1105, %1109
  store float %1110, float addrspace(3)* %27, align 4, !tbaa !5
  %1111 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %116
  %1112 = load float, float addrspace(3)* %1111, align 4, !tbaa !5
  %1113 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %1114 = fmul contract float %1112, %1113
  %1115 = fadd contract float %1110, %1114
  store float %1115, float addrspace(3)* %27, align 4, !tbaa !5
  %1116 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %119
  %1117 = load float, float addrspace(3)* %1116, align 4, !tbaa !5
  %1118 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %1119 = fmul contract float %1117, %1118
  %1120 = fadd contract float %1115, %1119
  store float %1120, float addrspace(3)* %27, align 4, !tbaa !5
  %1121 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %122
  %1122 = load float, float addrspace(3)* %1121, align 4, !tbaa !5
  %1123 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %1124 = fmul contract float %1122, %1123
  %1125 = fadd contract float %1120, %1124
  store float %1125, float addrspace(3)* %27, align 4, !tbaa !5
  %1126 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %125
  %1127 = load float, float addrspace(3)* %1126, align 4, !tbaa !5
  %1128 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %1129 = fmul contract float %1127, %1128
  %1130 = fadd contract float %1125, %1129
  store float %1130, float addrspace(3)* %27, align 4, !tbaa !5
  %1131 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %128
  %1132 = load float, float addrspace(3)* %1131, align 4, !tbaa !5
  %1133 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %1134 = fmul contract float %1132, %1133
  %1135 = fadd contract float %1130, %1134
  store float %1135, float addrspace(3)* %27, align 4, !tbaa !5
  %1136 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %131
  %1137 = load float, float addrspace(3)* %1136, align 4, !tbaa !5
  %1138 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %1139 = fmul contract float %1137, %1138
  %1140 = fadd contract float %1135, %1139
  store float %1140, float addrspace(3)* %27, align 4, !tbaa !5
  %1141 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 128), i32 %134
  %1142 = load float, float addrspace(3)* %1141, align 4, !tbaa !5
  %1143 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %1144 = fmul contract float %1142, %1143
  %1145 = fadd contract float %1140, %1144
  store float %1145, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1146 = shl nuw nsw i32 %9, 10
  %1147 = add nuw nsw i32 %1146, 163840
  %1148 = add i32 %19, %1147
  %1149 = sext i32 %1148 to i64
  %1150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1149
  %1151 = load float, float addrspace(1)* %1150, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1151, float addrspace(3)* %28, align 4, !tbaa !5
  %1152 = add nuw nsw i32 %1146, 167936
  %1153 = add i32 %19, %1152
  %1154 = sext i32 %1153 to i64
  %1155 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1154
  %1156 = load float, float addrspace(1)* %1155, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1156, float addrspace(3)* %30, align 4, !tbaa !5
  %1157 = add nuw nsw i32 %1146, 172032
  %1158 = add i32 %19, %1157
  %1159 = sext i32 %1158 to i64
  %1160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1159
  %1161 = load float, float addrspace(1)* %1160, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1161, float addrspace(3)* %32, align 4, !tbaa !5
  %1162 = add nuw nsw i32 %1146, 176128
  %1163 = add i32 %19, %1162
  %1164 = sext i32 %1163 to i64
  %1165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1164
  %1166 = load float, float addrspace(1)* %1165, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1166, float addrspace(3)* %34, align 4, !tbaa !5
  %1167 = add nuw nsw i32 %1146, 180224
  %1168 = add i32 %19, %1167
  %1169 = sext i32 %1168 to i64
  %1170 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1169
  %1171 = load float, float addrspace(1)* %1170, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1171, float addrspace(3)* %36, align 4, !tbaa !5
  %1172 = add nuw nsw i32 %1146, 184320
  %1173 = add i32 %19, %1172
  %1174 = sext i32 %1173 to i64
  %1175 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1174
  %1176 = load float, float addrspace(1)* %1175, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1176, float addrspace(3)* %38, align 4, !tbaa !5
  %1177 = add nuw nsw i32 %1146, 188416
  %1178 = add i32 %19, %1177
  %1179 = sext i32 %1178 to i64
  %1180 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1179
  %1181 = load float, float addrspace(1)* %1180, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1181, float addrspace(3)* %40, align 4, !tbaa !5
  %1182 = add nuw nsw i32 %1146, 192512
  %1183 = add i32 %19, %1182
  %1184 = sext i32 %1183 to i64
  %1185 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1184
  %1186 = load float, float addrspace(1)* %1185, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1186, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1187 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %10
  %1188 = load float, float addrspace(3)* %1187, align 4, !tbaa !5
  %1189 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %1190 = fmul contract float %1188, %1189
  %1191 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %1192 = fadd contract float %1191, %1190
  store float %1192, float addrspace(3)* %27, align 4, !tbaa !5
  %1193 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %44
  %1194 = load float, float addrspace(3)* %1193, align 4, !tbaa !5
  %1195 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %1196 = fmul contract float %1194, %1195
  %1197 = fadd contract float %1192, %1196
  store float %1197, float addrspace(3)* %27, align 4, !tbaa !5
  %1198 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %47
  %1199 = load float, float addrspace(3)* %1198, align 4, !tbaa !5
  %1200 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %1201 = fmul contract float %1199, %1200
  %1202 = fadd contract float %1197, %1201
  store float %1202, float addrspace(3)* %27, align 4, !tbaa !5
  %1203 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %50
  %1204 = load float, float addrspace(3)* %1203, align 4, !tbaa !5
  %1205 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %1206 = fmul contract float %1204, %1205
  %1207 = fadd contract float %1202, %1206
  store float %1207, float addrspace(3)* %27, align 4, !tbaa !5
  %1208 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %53
  %1209 = load float, float addrspace(3)* %1208, align 4, !tbaa !5
  %1210 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %1211 = fmul contract float %1209, %1210
  %1212 = fadd contract float %1207, %1211
  store float %1212, float addrspace(3)* %27, align 4, !tbaa !5
  %1213 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %56
  %1214 = load float, float addrspace(3)* %1213, align 4, !tbaa !5
  %1215 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %1216 = fmul contract float %1214, %1215
  %1217 = fadd contract float %1212, %1216
  store float %1217, float addrspace(3)* %27, align 4, !tbaa !5
  %1218 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %59
  %1219 = load float, float addrspace(3)* %1218, align 4, !tbaa !5
  %1220 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %1221 = fmul contract float %1219, %1220
  %1222 = fadd contract float %1217, %1221
  store float %1222, float addrspace(3)* %27, align 4, !tbaa !5
  %1223 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %62
  %1224 = load float, float addrspace(3)* %1223, align 4, !tbaa !5
  %1225 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %1226 = fmul contract float %1224, %1225
  %1227 = fadd contract float %1222, %1226
  store float %1227, float addrspace(3)* %27, align 4, !tbaa !5
  %1228 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %65
  %1229 = load float, float addrspace(3)* %1228, align 4, !tbaa !5
  %1230 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %1231 = fmul contract float %1229, %1230
  %1232 = fadd contract float %1227, %1231
  store float %1232, float addrspace(3)* %27, align 4, !tbaa !5
  %1233 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %68
  %1234 = load float, float addrspace(3)* %1233, align 4, !tbaa !5
  %1235 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %1236 = fmul contract float %1234, %1235
  %1237 = fadd contract float %1232, %1236
  store float %1237, float addrspace(3)* %27, align 4, !tbaa !5
  %1238 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %71
  %1239 = load float, float addrspace(3)* %1238, align 4, !tbaa !5
  %1240 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %1241 = fmul contract float %1239, %1240
  %1242 = fadd contract float %1237, %1241
  store float %1242, float addrspace(3)* %27, align 4, !tbaa !5
  %1243 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %74
  %1244 = load float, float addrspace(3)* %1243, align 4, !tbaa !5
  %1245 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %1246 = fmul contract float %1244, %1245
  %1247 = fadd contract float %1242, %1246
  store float %1247, float addrspace(3)* %27, align 4, !tbaa !5
  %1248 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %77
  %1249 = load float, float addrspace(3)* %1248, align 4, !tbaa !5
  %1250 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %1251 = fmul contract float %1249, %1250
  %1252 = fadd contract float %1247, %1251
  store float %1252, float addrspace(3)* %27, align 4, !tbaa !5
  %1253 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %80
  %1254 = load float, float addrspace(3)* %1253, align 4, !tbaa !5
  %1255 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %1256 = fmul contract float %1254, %1255
  %1257 = fadd contract float %1252, %1256
  store float %1257, float addrspace(3)* %27, align 4, !tbaa !5
  %1258 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %83
  %1259 = load float, float addrspace(3)* %1258, align 4, !tbaa !5
  %1260 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %1261 = fmul contract float %1259, %1260
  %1262 = fadd contract float %1257, %1261
  store float %1262, float addrspace(3)* %27, align 4, !tbaa !5
  %1263 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %86
  %1264 = load float, float addrspace(3)* %1263, align 4, !tbaa !5
  %1265 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %1266 = fmul contract float %1264, %1265
  %1267 = fadd contract float %1262, %1266
  store float %1267, float addrspace(3)* %27, align 4, !tbaa !5
  %1268 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %89
  %1269 = load float, float addrspace(3)* %1268, align 4, !tbaa !5
  %1270 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %1271 = fmul contract float %1269, %1270
  %1272 = fadd contract float %1267, %1271
  store float %1272, float addrspace(3)* %27, align 4, !tbaa !5
  %1273 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %92
  %1274 = load float, float addrspace(3)* %1273, align 4, !tbaa !5
  %1275 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %1276 = fmul contract float %1274, %1275
  %1277 = fadd contract float %1272, %1276
  store float %1277, float addrspace(3)* %27, align 4, !tbaa !5
  %1278 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %95
  %1279 = load float, float addrspace(3)* %1278, align 4, !tbaa !5
  %1280 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %1281 = fmul contract float %1279, %1280
  %1282 = fadd contract float %1277, %1281
  store float %1282, float addrspace(3)* %27, align 4, !tbaa !5
  %1283 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %98
  %1284 = load float, float addrspace(3)* %1283, align 4, !tbaa !5
  %1285 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %1286 = fmul contract float %1284, %1285
  %1287 = fadd contract float %1282, %1286
  store float %1287, float addrspace(3)* %27, align 4, !tbaa !5
  %1288 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %101
  %1289 = load float, float addrspace(3)* %1288, align 4, !tbaa !5
  %1290 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %1291 = fmul contract float %1289, %1290
  %1292 = fadd contract float %1287, %1291
  store float %1292, float addrspace(3)* %27, align 4, !tbaa !5
  %1293 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %104
  %1294 = load float, float addrspace(3)* %1293, align 4, !tbaa !5
  %1295 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %1296 = fmul contract float %1294, %1295
  %1297 = fadd contract float %1292, %1296
  store float %1297, float addrspace(3)* %27, align 4, !tbaa !5
  %1298 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %107
  %1299 = load float, float addrspace(3)* %1298, align 4, !tbaa !5
  %1300 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %1301 = fmul contract float %1299, %1300
  %1302 = fadd contract float %1297, %1301
  store float %1302, float addrspace(3)* %27, align 4, !tbaa !5
  %1303 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %110
  %1304 = load float, float addrspace(3)* %1303, align 4, !tbaa !5
  %1305 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %1306 = fmul contract float %1304, %1305
  %1307 = fadd contract float %1302, %1306
  store float %1307, float addrspace(3)* %27, align 4, !tbaa !5
  %1308 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %113
  %1309 = load float, float addrspace(3)* %1308, align 4, !tbaa !5
  %1310 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %1311 = fmul contract float %1309, %1310
  %1312 = fadd contract float %1307, %1311
  store float %1312, float addrspace(3)* %27, align 4, !tbaa !5
  %1313 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %116
  %1314 = load float, float addrspace(3)* %1313, align 4, !tbaa !5
  %1315 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %1316 = fmul contract float %1314, %1315
  %1317 = fadd contract float %1312, %1316
  store float %1317, float addrspace(3)* %27, align 4, !tbaa !5
  %1318 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %119
  %1319 = load float, float addrspace(3)* %1318, align 4, !tbaa !5
  %1320 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %1321 = fmul contract float %1319, %1320
  %1322 = fadd contract float %1317, %1321
  store float %1322, float addrspace(3)* %27, align 4, !tbaa !5
  %1323 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %122
  %1324 = load float, float addrspace(3)* %1323, align 4, !tbaa !5
  %1325 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %1326 = fmul contract float %1324, %1325
  %1327 = fadd contract float %1322, %1326
  store float %1327, float addrspace(3)* %27, align 4, !tbaa !5
  %1328 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %125
  %1329 = load float, float addrspace(3)* %1328, align 4, !tbaa !5
  %1330 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %1331 = fmul contract float %1329, %1330
  %1332 = fadd contract float %1327, %1331
  store float %1332, float addrspace(3)* %27, align 4, !tbaa !5
  %1333 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %128
  %1334 = load float, float addrspace(3)* %1333, align 4, !tbaa !5
  %1335 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %1336 = fmul contract float %1334, %1335
  %1337 = fadd contract float %1332, %1336
  store float %1337, float addrspace(3)* %27, align 4, !tbaa !5
  %1338 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %131
  %1339 = load float, float addrspace(3)* %1338, align 4, !tbaa !5
  %1340 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %1341 = fmul contract float %1339, %1340
  %1342 = fadd contract float %1337, %1341
  store float %1342, float addrspace(3)* %27, align 4, !tbaa !5
  %1343 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 160), i32 %134
  %1344 = load float, float addrspace(3)* %1343, align 4, !tbaa !5
  %1345 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %1346 = fmul contract float %1344, %1345
  %1347 = fadd contract float %1342, %1346
  store float %1347, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1348 = shl nuw nsw i32 %9, 10
  %1349 = add nuw nsw i32 %1348, 196608
  %1350 = add i32 %19, %1349
  %1351 = sext i32 %1350 to i64
  %1352 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1351
  %1353 = load float, float addrspace(1)* %1352, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1353, float addrspace(3)* %28, align 4, !tbaa !5
  %1354 = add nuw nsw i32 %1348, 200704
  %1355 = add i32 %19, %1354
  %1356 = sext i32 %1355 to i64
  %1357 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1356
  %1358 = load float, float addrspace(1)* %1357, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1358, float addrspace(3)* %30, align 4, !tbaa !5
  %1359 = add nuw nsw i32 %1348, 204800
  %1360 = add i32 %19, %1359
  %1361 = sext i32 %1360 to i64
  %1362 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1361
  %1363 = load float, float addrspace(1)* %1362, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1363, float addrspace(3)* %32, align 4, !tbaa !5
  %1364 = add nuw nsw i32 %1348, 208896
  %1365 = add i32 %19, %1364
  %1366 = sext i32 %1365 to i64
  %1367 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1366
  %1368 = load float, float addrspace(1)* %1367, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1368, float addrspace(3)* %34, align 4, !tbaa !5
  %1369 = add nuw nsw i32 %1348, 212992
  %1370 = add i32 %19, %1369
  %1371 = sext i32 %1370 to i64
  %1372 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1371
  %1373 = load float, float addrspace(1)* %1372, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1373, float addrspace(3)* %36, align 4, !tbaa !5
  %1374 = add nuw nsw i32 %1348, 217088
  %1375 = add i32 %19, %1374
  %1376 = sext i32 %1375 to i64
  %1377 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1376
  %1378 = load float, float addrspace(1)* %1377, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1378, float addrspace(3)* %38, align 4, !tbaa !5
  %1379 = add nuw nsw i32 %1348, 221184
  %1380 = add i32 %19, %1379
  %1381 = sext i32 %1380 to i64
  %1382 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1381
  %1383 = load float, float addrspace(1)* %1382, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1383, float addrspace(3)* %40, align 4, !tbaa !5
  %1384 = add nuw nsw i32 %1348, 225280
  %1385 = add i32 %19, %1384
  %1386 = sext i32 %1385 to i64
  %1387 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1386
  %1388 = load float, float addrspace(1)* %1387, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1388, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1389 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %10
  %1390 = load float, float addrspace(3)* %1389, align 4, !tbaa !5
  %1391 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %1392 = fmul contract float %1390, %1391
  %1393 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %1394 = fadd contract float %1393, %1392
  store float %1394, float addrspace(3)* %27, align 4, !tbaa !5
  %1395 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %44
  %1396 = load float, float addrspace(3)* %1395, align 4, !tbaa !5
  %1397 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %1398 = fmul contract float %1396, %1397
  %1399 = fadd contract float %1394, %1398
  store float %1399, float addrspace(3)* %27, align 4, !tbaa !5
  %1400 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %47
  %1401 = load float, float addrspace(3)* %1400, align 4, !tbaa !5
  %1402 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %1403 = fmul contract float %1401, %1402
  %1404 = fadd contract float %1399, %1403
  store float %1404, float addrspace(3)* %27, align 4, !tbaa !5
  %1405 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %50
  %1406 = load float, float addrspace(3)* %1405, align 4, !tbaa !5
  %1407 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %1408 = fmul contract float %1406, %1407
  %1409 = fadd contract float %1404, %1408
  store float %1409, float addrspace(3)* %27, align 4, !tbaa !5
  %1410 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %53
  %1411 = load float, float addrspace(3)* %1410, align 4, !tbaa !5
  %1412 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %1413 = fmul contract float %1411, %1412
  %1414 = fadd contract float %1409, %1413
  store float %1414, float addrspace(3)* %27, align 4, !tbaa !5
  %1415 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %56
  %1416 = load float, float addrspace(3)* %1415, align 4, !tbaa !5
  %1417 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %1418 = fmul contract float %1416, %1417
  %1419 = fadd contract float %1414, %1418
  store float %1419, float addrspace(3)* %27, align 4, !tbaa !5
  %1420 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %59
  %1421 = load float, float addrspace(3)* %1420, align 4, !tbaa !5
  %1422 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %1423 = fmul contract float %1421, %1422
  %1424 = fadd contract float %1419, %1423
  store float %1424, float addrspace(3)* %27, align 4, !tbaa !5
  %1425 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %62
  %1426 = load float, float addrspace(3)* %1425, align 4, !tbaa !5
  %1427 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %1428 = fmul contract float %1426, %1427
  %1429 = fadd contract float %1424, %1428
  store float %1429, float addrspace(3)* %27, align 4, !tbaa !5
  %1430 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %65
  %1431 = load float, float addrspace(3)* %1430, align 4, !tbaa !5
  %1432 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %1433 = fmul contract float %1431, %1432
  %1434 = fadd contract float %1429, %1433
  store float %1434, float addrspace(3)* %27, align 4, !tbaa !5
  %1435 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %68
  %1436 = load float, float addrspace(3)* %1435, align 4, !tbaa !5
  %1437 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %1438 = fmul contract float %1436, %1437
  %1439 = fadd contract float %1434, %1438
  store float %1439, float addrspace(3)* %27, align 4, !tbaa !5
  %1440 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %71
  %1441 = load float, float addrspace(3)* %1440, align 4, !tbaa !5
  %1442 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %1443 = fmul contract float %1441, %1442
  %1444 = fadd contract float %1439, %1443
  store float %1444, float addrspace(3)* %27, align 4, !tbaa !5
  %1445 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %74
  %1446 = load float, float addrspace(3)* %1445, align 4, !tbaa !5
  %1447 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %1448 = fmul contract float %1446, %1447
  %1449 = fadd contract float %1444, %1448
  store float %1449, float addrspace(3)* %27, align 4, !tbaa !5
  %1450 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %77
  %1451 = load float, float addrspace(3)* %1450, align 4, !tbaa !5
  %1452 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %1453 = fmul contract float %1451, %1452
  %1454 = fadd contract float %1449, %1453
  store float %1454, float addrspace(3)* %27, align 4, !tbaa !5
  %1455 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %80
  %1456 = load float, float addrspace(3)* %1455, align 4, !tbaa !5
  %1457 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %1458 = fmul contract float %1456, %1457
  %1459 = fadd contract float %1454, %1458
  store float %1459, float addrspace(3)* %27, align 4, !tbaa !5
  %1460 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %83
  %1461 = load float, float addrspace(3)* %1460, align 4, !tbaa !5
  %1462 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %1463 = fmul contract float %1461, %1462
  %1464 = fadd contract float %1459, %1463
  store float %1464, float addrspace(3)* %27, align 4, !tbaa !5
  %1465 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %86
  %1466 = load float, float addrspace(3)* %1465, align 4, !tbaa !5
  %1467 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %1468 = fmul contract float %1466, %1467
  %1469 = fadd contract float %1464, %1468
  store float %1469, float addrspace(3)* %27, align 4, !tbaa !5
  %1470 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %89
  %1471 = load float, float addrspace(3)* %1470, align 4, !tbaa !5
  %1472 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %1473 = fmul contract float %1471, %1472
  %1474 = fadd contract float %1469, %1473
  store float %1474, float addrspace(3)* %27, align 4, !tbaa !5
  %1475 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %92
  %1476 = load float, float addrspace(3)* %1475, align 4, !tbaa !5
  %1477 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %1478 = fmul contract float %1476, %1477
  %1479 = fadd contract float %1474, %1478
  store float %1479, float addrspace(3)* %27, align 4, !tbaa !5
  %1480 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %95
  %1481 = load float, float addrspace(3)* %1480, align 4, !tbaa !5
  %1482 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %1483 = fmul contract float %1481, %1482
  %1484 = fadd contract float %1479, %1483
  store float %1484, float addrspace(3)* %27, align 4, !tbaa !5
  %1485 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %98
  %1486 = load float, float addrspace(3)* %1485, align 4, !tbaa !5
  %1487 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %1488 = fmul contract float %1486, %1487
  %1489 = fadd contract float %1484, %1488
  store float %1489, float addrspace(3)* %27, align 4, !tbaa !5
  %1490 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %101
  %1491 = load float, float addrspace(3)* %1490, align 4, !tbaa !5
  %1492 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %1493 = fmul contract float %1491, %1492
  %1494 = fadd contract float %1489, %1493
  store float %1494, float addrspace(3)* %27, align 4, !tbaa !5
  %1495 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %104
  %1496 = load float, float addrspace(3)* %1495, align 4, !tbaa !5
  %1497 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %1498 = fmul contract float %1496, %1497
  %1499 = fadd contract float %1494, %1498
  store float %1499, float addrspace(3)* %27, align 4, !tbaa !5
  %1500 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %107
  %1501 = load float, float addrspace(3)* %1500, align 4, !tbaa !5
  %1502 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %1503 = fmul contract float %1501, %1502
  %1504 = fadd contract float %1499, %1503
  store float %1504, float addrspace(3)* %27, align 4, !tbaa !5
  %1505 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %110
  %1506 = load float, float addrspace(3)* %1505, align 4, !tbaa !5
  %1507 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %1508 = fmul contract float %1506, %1507
  %1509 = fadd contract float %1504, %1508
  store float %1509, float addrspace(3)* %27, align 4, !tbaa !5
  %1510 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %113
  %1511 = load float, float addrspace(3)* %1510, align 4, !tbaa !5
  %1512 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %1513 = fmul contract float %1511, %1512
  %1514 = fadd contract float %1509, %1513
  store float %1514, float addrspace(3)* %27, align 4, !tbaa !5
  %1515 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %116
  %1516 = load float, float addrspace(3)* %1515, align 4, !tbaa !5
  %1517 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %1518 = fmul contract float %1516, %1517
  %1519 = fadd contract float %1514, %1518
  store float %1519, float addrspace(3)* %27, align 4, !tbaa !5
  %1520 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %119
  %1521 = load float, float addrspace(3)* %1520, align 4, !tbaa !5
  %1522 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %1523 = fmul contract float %1521, %1522
  %1524 = fadd contract float %1519, %1523
  store float %1524, float addrspace(3)* %27, align 4, !tbaa !5
  %1525 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %122
  %1526 = load float, float addrspace(3)* %1525, align 4, !tbaa !5
  %1527 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %1528 = fmul contract float %1526, %1527
  %1529 = fadd contract float %1524, %1528
  store float %1529, float addrspace(3)* %27, align 4, !tbaa !5
  %1530 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %125
  %1531 = load float, float addrspace(3)* %1530, align 4, !tbaa !5
  %1532 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %1533 = fmul contract float %1531, %1532
  %1534 = fadd contract float %1529, %1533
  store float %1534, float addrspace(3)* %27, align 4, !tbaa !5
  %1535 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %128
  %1536 = load float, float addrspace(3)* %1535, align 4, !tbaa !5
  %1537 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %1538 = fmul contract float %1536, %1537
  %1539 = fadd contract float %1534, %1538
  store float %1539, float addrspace(3)* %27, align 4, !tbaa !5
  %1540 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %131
  %1541 = load float, float addrspace(3)* %1540, align 4, !tbaa !5
  %1542 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %1543 = fmul contract float %1541, %1542
  %1544 = fadd contract float %1539, %1543
  store float %1544, float addrspace(3)* %27, align 4, !tbaa !5
  %1545 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 192), i32 %134
  %1546 = load float, float addrspace(3)* %1545, align 4, !tbaa !5
  %1547 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %1548 = fmul contract float %1546, %1547
  %1549 = fadd contract float %1544, %1548
  store float %1549, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1550 = shl nuw nsw i32 %9, 10
  %1551 = add nuw nsw i32 %1550, 229376
  %1552 = add i32 %19, %1551
  %1553 = sext i32 %1552 to i64
  %1554 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1553
  %1555 = load float, float addrspace(1)* %1554, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1555, float addrspace(3)* %28, align 4, !tbaa !5
  %1556 = add nuw nsw i32 %1550, 233472
  %1557 = add i32 %19, %1556
  %1558 = sext i32 %1557 to i64
  %1559 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1558
  %1560 = load float, float addrspace(1)* %1559, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1560, float addrspace(3)* %30, align 4, !tbaa !5
  %1561 = add nuw nsw i32 %1550, 237568
  %1562 = add i32 %19, %1561
  %1563 = sext i32 %1562 to i64
  %1564 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1563
  %1565 = load float, float addrspace(1)* %1564, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1565, float addrspace(3)* %32, align 4, !tbaa !5
  %1566 = add nuw nsw i32 %1550, 241664
  %1567 = add i32 %19, %1566
  %1568 = sext i32 %1567 to i64
  %1569 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1568
  %1570 = load float, float addrspace(1)* %1569, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1570, float addrspace(3)* %34, align 4, !tbaa !5
  %1571 = add nuw nsw i32 %1550, 245760
  %1572 = add i32 %19, %1571
  %1573 = sext i32 %1572 to i64
  %1574 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1573
  %1575 = load float, float addrspace(1)* %1574, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1575, float addrspace(3)* %36, align 4, !tbaa !5
  %1576 = add nuw nsw i32 %1550, 249856
  %1577 = add i32 %19, %1576
  %1578 = sext i32 %1577 to i64
  %1579 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1578
  %1580 = load float, float addrspace(1)* %1579, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1580, float addrspace(3)* %38, align 4, !tbaa !5
  %1581 = add nuw nsw i32 %1550, 253952
  %1582 = add i32 %19, %1581
  %1583 = sext i32 %1582 to i64
  %1584 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1583
  %1585 = load float, float addrspace(1)* %1584, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1585, float addrspace(3)* %40, align 4, !tbaa !5
  %1586 = add nuw nsw i32 %1550, 258048
  %1587 = add i32 %19, %1586
  %1588 = sext i32 %1587 to i64
  %1589 = getelementptr inbounds float, float addrspace(1)* %1, i64 %1588
  %1590 = load float, float addrspace(1)* %1589, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %1590, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1591 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %10
  %1592 = load float, float addrspace(3)* %1591, align 4, !tbaa !5
  %1593 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %1594 = fmul contract float %1592, %1593
  %1595 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %1596 = fadd contract float %1595, %1594
  store float %1596, float addrspace(3)* %27, align 4, !tbaa !5
  %1597 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %44
  %1598 = load float, float addrspace(3)* %1597, align 4, !tbaa !5
  %1599 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %1600 = fmul contract float %1598, %1599
  %1601 = fadd contract float %1596, %1600
  store float %1601, float addrspace(3)* %27, align 4, !tbaa !5
  %1602 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %47
  %1603 = load float, float addrspace(3)* %1602, align 4, !tbaa !5
  %1604 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %1605 = fmul contract float %1603, %1604
  %1606 = fadd contract float %1601, %1605
  store float %1606, float addrspace(3)* %27, align 4, !tbaa !5
  %1607 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %50
  %1608 = load float, float addrspace(3)* %1607, align 4, !tbaa !5
  %1609 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %1610 = fmul contract float %1608, %1609
  %1611 = fadd contract float %1606, %1610
  store float %1611, float addrspace(3)* %27, align 4, !tbaa !5
  %1612 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %53
  %1613 = load float, float addrspace(3)* %1612, align 4, !tbaa !5
  %1614 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %1615 = fmul contract float %1613, %1614
  %1616 = fadd contract float %1611, %1615
  store float %1616, float addrspace(3)* %27, align 4, !tbaa !5
  %1617 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %56
  %1618 = load float, float addrspace(3)* %1617, align 4, !tbaa !5
  %1619 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %1620 = fmul contract float %1618, %1619
  %1621 = fadd contract float %1616, %1620
  store float %1621, float addrspace(3)* %27, align 4, !tbaa !5
  %1622 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %59
  %1623 = load float, float addrspace(3)* %1622, align 4, !tbaa !5
  %1624 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %1625 = fmul contract float %1623, %1624
  %1626 = fadd contract float %1621, %1625
  store float %1626, float addrspace(3)* %27, align 4, !tbaa !5
  %1627 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %62
  %1628 = load float, float addrspace(3)* %1627, align 4, !tbaa !5
  %1629 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %1630 = fmul contract float %1628, %1629
  %1631 = fadd contract float %1626, %1630
  store float %1631, float addrspace(3)* %27, align 4, !tbaa !5
  %1632 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %65
  %1633 = load float, float addrspace(3)* %1632, align 4, !tbaa !5
  %1634 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %1635 = fmul contract float %1633, %1634
  %1636 = fadd contract float %1631, %1635
  store float %1636, float addrspace(3)* %27, align 4, !tbaa !5
  %1637 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %68
  %1638 = load float, float addrspace(3)* %1637, align 4, !tbaa !5
  %1639 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %1640 = fmul contract float %1638, %1639
  %1641 = fadd contract float %1636, %1640
  store float %1641, float addrspace(3)* %27, align 4, !tbaa !5
  %1642 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %71
  %1643 = load float, float addrspace(3)* %1642, align 4, !tbaa !5
  %1644 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %1645 = fmul contract float %1643, %1644
  %1646 = fadd contract float %1641, %1645
  store float %1646, float addrspace(3)* %27, align 4, !tbaa !5
  %1647 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %74
  %1648 = load float, float addrspace(3)* %1647, align 4, !tbaa !5
  %1649 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %1650 = fmul contract float %1648, %1649
  %1651 = fadd contract float %1646, %1650
  store float %1651, float addrspace(3)* %27, align 4, !tbaa !5
  %1652 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %77
  %1653 = load float, float addrspace(3)* %1652, align 4, !tbaa !5
  %1654 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %1655 = fmul contract float %1653, %1654
  %1656 = fadd contract float %1651, %1655
  store float %1656, float addrspace(3)* %27, align 4, !tbaa !5
  %1657 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %80
  %1658 = load float, float addrspace(3)* %1657, align 4, !tbaa !5
  %1659 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %1660 = fmul contract float %1658, %1659
  %1661 = fadd contract float %1656, %1660
  store float %1661, float addrspace(3)* %27, align 4, !tbaa !5
  %1662 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %83
  %1663 = load float, float addrspace(3)* %1662, align 4, !tbaa !5
  %1664 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %1665 = fmul contract float %1663, %1664
  %1666 = fadd contract float %1661, %1665
  store float %1666, float addrspace(3)* %27, align 4, !tbaa !5
  %1667 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %86
  %1668 = load float, float addrspace(3)* %1667, align 4, !tbaa !5
  %1669 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %1670 = fmul contract float %1668, %1669
  %1671 = fadd contract float %1666, %1670
  store float %1671, float addrspace(3)* %27, align 4, !tbaa !5
  %1672 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %89
  %1673 = load float, float addrspace(3)* %1672, align 4, !tbaa !5
  %1674 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %1675 = fmul contract float %1673, %1674
  %1676 = fadd contract float %1671, %1675
  store float %1676, float addrspace(3)* %27, align 4, !tbaa !5
  %1677 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %92
  %1678 = load float, float addrspace(3)* %1677, align 4, !tbaa !5
  %1679 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %1680 = fmul contract float %1678, %1679
  %1681 = fadd contract float %1676, %1680
  store float %1681, float addrspace(3)* %27, align 4, !tbaa !5
  %1682 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %95
  %1683 = load float, float addrspace(3)* %1682, align 4, !tbaa !5
  %1684 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %1685 = fmul contract float %1683, %1684
  %1686 = fadd contract float %1681, %1685
  store float %1686, float addrspace(3)* %27, align 4, !tbaa !5
  %1687 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %98
  %1688 = load float, float addrspace(3)* %1687, align 4, !tbaa !5
  %1689 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %1690 = fmul contract float %1688, %1689
  %1691 = fadd contract float %1686, %1690
  store float %1691, float addrspace(3)* %27, align 4, !tbaa !5
  %1692 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %101
  %1693 = load float, float addrspace(3)* %1692, align 4, !tbaa !5
  %1694 = load float, float addrspace(3)* %103, align 4, !tbaa !5
  %1695 = fmul contract float %1693, %1694
  %1696 = fadd contract float %1691, %1695
  store float %1696, float addrspace(3)* %27, align 4, !tbaa !5
  %1697 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %104
  %1698 = load float, float addrspace(3)* %1697, align 4, !tbaa !5
  %1699 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %1700 = fmul contract float %1698, %1699
  %1701 = fadd contract float %1696, %1700
  store float %1701, float addrspace(3)* %27, align 4, !tbaa !5
  %1702 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %107
  %1703 = load float, float addrspace(3)* %1702, align 4, !tbaa !5
  %1704 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %1705 = fmul contract float %1703, %1704
  %1706 = fadd contract float %1701, %1705
  store float %1706, float addrspace(3)* %27, align 4, !tbaa !5
  %1707 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %110
  %1708 = load float, float addrspace(3)* %1707, align 4, !tbaa !5
  %1709 = load float, float addrspace(3)* %112, align 4, !tbaa !5
  %1710 = fmul contract float %1708, %1709
  %1711 = fadd contract float %1706, %1710
  store float %1711, float addrspace(3)* %27, align 4, !tbaa !5
  %1712 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %113
  %1713 = load float, float addrspace(3)* %1712, align 4, !tbaa !5
  %1714 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %1715 = fmul contract float %1713, %1714
  %1716 = fadd contract float %1711, %1715
  store float %1716, float addrspace(3)* %27, align 4, !tbaa !5
  %1717 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %116
  %1718 = load float, float addrspace(3)* %1717, align 4, !tbaa !5
  %1719 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %1720 = fmul contract float %1718, %1719
  %1721 = fadd contract float %1716, %1720
  store float %1721, float addrspace(3)* %27, align 4, !tbaa !5
  %1722 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %119
  %1723 = load float, float addrspace(3)* %1722, align 4, !tbaa !5
  %1724 = load float, float addrspace(3)* %121, align 4, !tbaa !5
  %1725 = fmul contract float %1723, %1724
  %1726 = fadd contract float %1721, %1725
  store float %1726, float addrspace(3)* %27, align 4, !tbaa !5
  %1727 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %122
  %1728 = load float, float addrspace(3)* %1727, align 4, !tbaa !5
  %1729 = load float, float addrspace(3)* %124, align 4, !tbaa !5
  %1730 = fmul contract float %1728, %1729
  %1731 = fadd contract float %1726, %1730
  store float %1731, float addrspace(3)* %27, align 4, !tbaa !5
  %1732 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %125
  %1733 = load float, float addrspace(3)* %1732, align 4, !tbaa !5
  %1734 = load float, float addrspace(3)* %127, align 4, !tbaa !5
  %1735 = fmul contract float %1733, %1734
  %1736 = fadd contract float %1731, %1735
  store float %1736, float addrspace(3)* %27, align 4, !tbaa !5
  %1737 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %128
  %1738 = load float, float addrspace(3)* %1737, align 4, !tbaa !5
  %1739 = load float, float addrspace(3)* %130, align 4, !tbaa !5
  %1740 = fmul contract float %1738, %1739
  %1741 = fadd contract float %1736, %1740
  store float %1741, float addrspace(3)* %27, align 4, !tbaa !5
  %1742 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %131
  %1743 = load float, float addrspace(3)* %1742, align 4, !tbaa !5
  %1744 = load float, float addrspace(3)* %133, align 4, !tbaa !5
  %1745 = fmul contract float %1743, %1744
  %1746 = fadd contract float %1741, %1745
  store float %1746, float addrspace(3)* %27, align 4, !tbaa !5
  %1747 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 224), i32 %134
  %1748 = load float, float addrspace(3)* %1747, align 4, !tbaa !5
  %1749 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %1750 = fmul contract float %1748, %1749
  %1751 = fadd contract float %1746, %1750
  store float %1751, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1752 = shl nsw i32 %6, 12
  %1753 = sext i32 %1752 to i64
  %1754 = getelementptr inbounds float, float addrspace(1)* %4, i64 %1753
  %1755 = sext i32 %18 to i64
  %1756 = getelementptr inbounds float, float addrspace(1)* %1754, i64 %1755
  %1757 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %1758 = load float, float addrspace(3)* %27, align 4, !tbaa !5
  %1759 = fmul contract float %1757, %1758
  %1760 = load float, float addrspace(3)* %23, align 4, !tbaa !5
  %1761 = fadd contract float %1759, %1760
  %1762 = shl nuw nsw i32 %9, 10
  %1763 = or i32 %1762, %8
  %1764 = zext i32 %1763 to i64
  %1765 = getelementptr inbounds float, float addrspace(1)* %1756, i64 %1764
  store float %1761, float addrspace(1)* %1765, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
