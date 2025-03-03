; ModuleID = '../data/hip_kernels/104/5/main.cu'
source_filename = "../data/hip_kernels/104/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4scanPfS_S_iE10scan_array = internal unnamed_addr addrspace(3) global [2048 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4scanPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 11
  %8 = or i32 %7, %5
  %9 = icmp ult i32 %8, %3
  br i1 %9, label %10, label %14

10:                                               ; preds = %4
  %11 = zext i32 %8 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %0, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %14

14:                                               ; preds = %4, %10
  %15 = phi float [ %13, %10 ], [ 0.000000e+00, %4 ]
  %16 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %5
  store float %15, float addrspace(3)* %16, align 4
  %17 = add nuw nsw i32 %7, 1024
  %18 = or i32 %17, %5
  %19 = icmp ult i32 %18, %3
  br i1 %19, label %20, label %24

20:                                               ; preds = %14
  %21 = zext i32 %18 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %24

24:                                               ; preds = %14, %20
  %25 = phi float [ %23, %20 ], [ 0.000000e+00, %14 ]
  %26 = or i32 %5, 1024
  %27 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %26
  store float %25, float addrspace(3)* %27, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = shl nuw nsw i32 %5, 1
  %29 = add nuw nsw i32 %28, 2
  %30 = add nuw nsw i32 %28, 1
  %31 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %28
  %32 = load float, float addrspace(3)* %31, align 8, !tbaa !5
  %33 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %30
  %34 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %35 = fadd contract float %32, %34
  store float %35, float addrspace(3)* %33, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = shl nuw nsw i32 %29, 1
  %37 = add nsw i32 %36, -1
  %38 = icmp ult i32 %5, 512
  br i1 %38, label %39, label %46

39:                                               ; preds = %24
  %40 = add nsw i32 %36, -3
  %41 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %40
  %42 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %43 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %37
  %44 = load float, float addrspace(3)* %43, align 4, !tbaa !5
  %45 = fadd contract float %42, %44
  store float %45, float addrspace(3)* %43, align 4, !tbaa !5
  br label %46

46:                                               ; preds = %39, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = shl nuw nsw i32 %29, 2
  %48 = add nsw i32 %47, -1
  %49 = icmp ult i32 %5, 256
  br i1 %49, label %50, label %57

50:                                               ; preds = %46
  %51 = add nsw i32 %47, -5
  %52 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %54 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %48
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %56 = fadd contract float %53, %55
  store float %56, float addrspace(3)* %54, align 4, !tbaa !5
  br label %57

57:                                               ; preds = %50, %46
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = shl nuw nsw i32 %29, 3
  %59 = add nsw i32 %58, -1
  %60 = icmp ult i32 %5, 128
  br i1 %60, label %61, label %68

61:                                               ; preds = %57
  %62 = add nsw i32 %58, -9
  %63 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %62
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %65 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %59
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !5
  %67 = fadd contract float %64, %66
  store float %67, float addrspace(3)* %65, align 4, !tbaa !5
  br label %68

68:                                               ; preds = %61, %57
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = shl nuw nsw i32 %29, 4
  %70 = add nsw i32 %69, -1
  %71 = icmp ult i32 %5, 64
  br i1 %71, label %72, label %79

72:                                               ; preds = %68
  %73 = add nsw i32 %69, -17
  %74 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !5
  %76 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %70
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %78 = fadd contract float %75, %77
  store float %78, float addrspace(3)* %76, align 4, !tbaa !5
  br label %79

79:                                               ; preds = %72, %68
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = shl nuw nsw i32 %29, 5
  %81 = add nsw i32 %80, -1
  %82 = icmp ult i32 %5, 32
  br i1 %82, label %83, label %90

83:                                               ; preds = %79
  %84 = add nsw i32 %80, -33
  %85 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %87 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %81
  %88 = load float, float addrspace(3)* %87, align 4, !tbaa !5
  %89 = fadd contract float %86, %88
  store float %89, float addrspace(3)* %87, align 4, !tbaa !5
  br label %90

90:                                               ; preds = %83, %79
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = shl nuw nsw i32 %29, 6
  %92 = add nsw i32 %91, -1
  %93 = icmp ult i32 %5, 16
  br i1 %93, label %94, label %101

94:                                               ; preds = %90
  %95 = add nsw i32 %91, -65
  %96 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %95
  %97 = load float, float addrspace(3)* %96, align 4, !tbaa !5
  %98 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %92
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !5
  %100 = fadd contract float %97, %99
  store float %100, float addrspace(3)* %98, align 4, !tbaa !5
  br label %101

101:                                              ; preds = %94, %90
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = shl nuw nsw i32 %29, 7
  %103 = add nsw i32 %102, -1
  %104 = icmp ult i32 %5, 8
  br i1 %104, label %105, label %112

105:                                              ; preds = %101
  %106 = add nsw i32 %102, -129
  %107 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %106
  %108 = load float, float addrspace(3)* %107, align 4, !tbaa !5
  %109 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %103
  %110 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %111 = fadd contract float %108, %110
  store float %111, float addrspace(3)* %109, align 4, !tbaa !5
  br label %112

112:                                              ; preds = %105, %101
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %113 = shl nuw nsw i32 %29, 8
  %114 = add nsw i32 %113, -1
  %115 = icmp ult i32 %5, 4
  br i1 %115, label %116, label %123

116:                                              ; preds = %112
  %117 = add nsw i32 %113, -257
  %118 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %117
  %119 = load float, float addrspace(3)* %118, align 4, !tbaa !5
  %120 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %114
  %121 = load float, float addrspace(3)* %120, align 4, !tbaa !5
  %122 = fadd contract float %119, %121
  store float %122, float addrspace(3)* %120, align 4, !tbaa !5
  br label %123

123:                                              ; preds = %116, %112
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %124 = shl nuw nsw i32 %29, 9
  %125 = add nsw i32 %124, -1
  %126 = icmp ult i32 %5, 2
  br i1 %126, label %127, label %134

127:                                              ; preds = %123
  %128 = add nsw i32 %124, -513
  %129 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %128
  %130 = load float, float addrspace(3)* %129, align 4, !tbaa !5
  %131 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %125
  %132 = load float, float addrspace(3)* %131, align 4, !tbaa !5
  %133 = fadd contract float %130, %132
  store float %133, float addrspace(3)* %131, align 4, !tbaa !5
  br label %134

134:                                              ; preds = %127, %123
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %135 = shl nuw nsw i32 %29, 10
  %136 = icmp eq i32 %5, 0
  br i1 %136, label %137, label %145

137:                                              ; preds = %134
  %138 = add nsw i32 %135, -1
  %139 = add nsw i32 %135, -1025
  %140 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %139
  %141 = load float, float addrspace(3)* %140, align 4, !tbaa !5
  %142 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %138
  %143 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %144 = fadd contract float %141, %143
  store float %144, float addrspace(3)* %142, align 4, !tbaa !5
  br label %145

145:                                              ; preds = %137, %134
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %146 = icmp eq i32 %5, 0
  br i1 %146, label %147, label %154

147:                                              ; preds = %145
  %148 = add nuw nsw i32 %124, 511
  %149 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %125
  %150 = load float, float addrspace(3)* %149, align 4, !tbaa !5
  %151 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %148
  %152 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %153 = fadd contract float %150, %152
  store float %153, float addrspace(3)* %151, align 4, !tbaa !5
  br label %154

154:                                              ; preds = %147, %145
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %155 = icmp ult i32 %5, 3
  br i1 %155, label %156, label %163

156:                                              ; preds = %154
  %157 = add nuw nsw i32 %113, 255
  %158 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %114
  %159 = load float, float addrspace(3)* %158, align 4, !tbaa !5
  %160 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %157
  %161 = load float, float addrspace(3)* %160, align 4, !tbaa !5
  %162 = fadd contract float %159, %161
  store float %162, float addrspace(3)* %160, align 4, !tbaa !5
  br label %163

163:                                              ; preds = %156, %154
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %164 = icmp ult i32 %5, 7
  br i1 %164, label %165, label %172

165:                                              ; preds = %163
  %166 = add nuw nsw i32 %102, 127
  %167 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %103
  %168 = load float, float addrspace(3)* %167, align 4, !tbaa !5
  %169 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %166
  %170 = load float, float addrspace(3)* %169, align 4, !tbaa !5
  %171 = fadd contract float %168, %170
  store float %171, float addrspace(3)* %169, align 4, !tbaa !5
  br label %172

172:                                              ; preds = %165, %163
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %173 = icmp ult i32 %5, 15
  br i1 %173, label %174, label %181

174:                                              ; preds = %172
  %175 = add nuw nsw i32 %91, 63
  %176 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %92
  %177 = load float, float addrspace(3)* %176, align 4, !tbaa !5
  %178 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %175
  %179 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %180 = fadd contract float %177, %179
  store float %180, float addrspace(3)* %178, align 4, !tbaa !5
  br label %181

181:                                              ; preds = %174, %172
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %182 = icmp ult i32 %5, 31
  br i1 %182, label %183, label %190

183:                                              ; preds = %181
  %184 = add nuw nsw i32 %80, 31
  %185 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %81
  %186 = load float, float addrspace(3)* %185, align 4, !tbaa !5
  %187 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %184
  %188 = load float, float addrspace(3)* %187, align 4, !tbaa !5
  %189 = fadd contract float %186, %188
  store float %189, float addrspace(3)* %187, align 4, !tbaa !5
  br label %190

190:                                              ; preds = %183, %181
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %191 = icmp ult i32 %5, 63
  br i1 %191, label %192, label %199

192:                                              ; preds = %190
  %193 = add nuw nsw i32 %69, 15
  %194 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %70
  %195 = load float, float addrspace(3)* %194, align 4, !tbaa !5
  %196 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %193
  %197 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %198 = fadd contract float %195, %197
  store float %198, float addrspace(3)* %196, align 4, !tbaa !5
  br label %199

199:                                              ; preds = %192, %190
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %200 = icmp ult i32 %5, 127
  br i1 %200, label %201, label %208

201:                                              ; preds = %199
  %202 = add nuw nsw i32 %58, 7
  %203 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %59
  %204 = load float, float addrspace(3)* %203, align 4, !tbaa !5
  %205 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %202
  %206 = load float, float addrspace(3)* %205, align 4, !tbaa !5
  %207 = fadd contract float %204, %206
  store float %207, float addrspace(3)* %205, align 4, !tbaa !5
  br label %208

208:                                              ; preds = %201, %199
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %209 = icmp ult i32 %5, 255
  br i1 %209, label %210, label %217

210:                                              ; preds = %208
  %211 = add nuw nsw i32 %47, 3
  %212 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %48
  %213 = load float, float addrspace(3)* %212, align 4, !tbaa !5
  %214 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %211
  %215 = load float, float addrspace(3)* %214, align 4, !tbaa !5
  %216 = fadd contract float %213, %215
  store float %216, float addrspace(3)* %214, align 4, !tbaa !5
  br label %217

217:                                              ; preds = %210, %208
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %218 = icmp ult i32 %5, 511
  br i1 %218, label %219, label %226

219:                                              ; preds = %217
  %220 = add nuw nsw i32 %36, 1
  %221 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %37
  %222 = load float, float addrspace(3)* %221, align 4, !tbaa !5
  %223 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %220
  %224 = load float, float addrspace(3)* %223, align 4, !tbaa !5
  %225 = fadd contract float %222, %224
  store float %225, float addrspace(3)* %223, align 4, !tbaa !5
  br label %226

226:                                              ; preds = %219, %217
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %227 = icmp eq i32 %5, 1023
  br i1 %227, label %234, label %228

228:                                              ; preds = %226
  %229 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %30
  %230 = load float, float addrspace(3)* %229, align 4, !tbaa !5
  %231 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %29
  %232 = load float, float addrspace(3)* %231, align 8, !tbaa !5
  %233 = fadd contract float %230, %232
  store float %233, float addrspace(3)* %231, align 8, !tbaa !5
  br label %234

234:                                              ; preds = %228, %226
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %9, label %235, label %239

235:                                              ; preds = %234
  %236 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %237 = zext i32 %8 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %1, i64 %237
  store float %236, float addrspace(1)* %238, align 4, !tbaa !5
  br label %239

239:                                              ; preds = %235, %234
  br i1 %19, label %240, label %246

240:                                              ; preds = %239
  %241 = or i32 %5, 1024
  %242 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 %241
  %243 = load float, float addrspace(3)* %242, align 4, !tbaa !5
  %244 = zext i32 %18 to i64
  %245 = getelementptr inbounds float, float addrspace(1)* %1, i64 %244
  store float %243, float addrspace(1)* %245, align 4, !tbaa !5
  br label %246

246:                                              ; preds = %240, %239
  %247 = icmp ne float addrspace(1)* %2, addrspacecast (float* null to float addrspace(1)*)
  %248 = icmp eq i32 %5, 0
  %249 = select i1 %247, i1 %248, i1 false
  br i1 %249, label %250, label %254

250:                                              ; preds = %246
  %251 = load float, float addrspace(3)* getelementptr inbounds ([2048 x float], [2048 x float] addrspace(3)* @_ZZ4scanPfS_S_iE10scan_array, i32 0, i32 2047), align 4, !tbaa !5
  %252 = zext i32 %6 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %2, i64 %252
  store float %251, float addrspace(1)* %253, align 4, !tbaa !5
  br label %254

254:                                              ; preds = %250, %246
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
